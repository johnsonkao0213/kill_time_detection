# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import torch
from sklearn.metrics import log_loss, roc_auc_score, f1_score, precision_score, recall_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, MinMaxScaler

from deepctr_torch.inputs import SparseFeat, DenseFeat, get_feature_names, combined_dnn_input
from deepctr_torch.models import *
from deepctr_torch.layers import FM, DNN
import torch.nn as nn

class DeepFMChannelSize(DeepFM):
    def __init__(self,
                 linear_feature_columns, dnn_feature_columns, use_fm=True,
                 dnn_hidden_units=(256, 128),
                 l2_reg_linear=0.00001, l2_reg_embedding=0.00001, l2_reg_dnn=0, init_std=0.0001, seed=1024,
                 dnn_dropout=0,
                 dnn_activation='relu', dnn_use_bn=False, task='binary', device='cpu', gpus=None):

        super(DeepFM, self).__init__(linear_feature_columns, dnn_feature_columns, l2_reg_linear=l2_reg_linear,
                                     l2_reg_embedding=l2_reg_embedding, init_std=init_std, seed=seed, task=task,
                                     device=device, gpus=gpus)

        self.use_fm = use_fm
        self.use_dnn = len(dnn_feature_columns) > 0 and len(
            dnn_hidden_units) > 0
        if use_fm:
            self.fm = FM()

        if self.use_dnn:
            self.dnn = DNN(self.compute_input_dim(dnn_feature_columns), dnn_hidden_units,
                           activation=dnn_activation, l2_reg=l2_reg_dnn, dropout_rate=dnn_dropout, use_bn=dnn_use_bn,
                           init_std=init_std, device=device)
            self.dnn_linear = nn.Linear(
                dnn_hidden_units[-1],1 , bias=False).to(device) # dim : batch_size * 1
            
            self.add_regularization_weight(
                filter(lambda x: 'weight' in x[0] and 'bn' not in x[0], self.dnn.named_parameters()), l2=l2_reg_dnn)
            self.add_regularization_weight(self.dnn_linear.weight, l2=l2_reg_dnn)
        self.device = device
        self.to(device)

    def forward(self, X):
        sparse_embedding_list, dense_value_list = self.input_from_feature_columns(X, self.dnn_feature_columns,
                                                                                  self.embedding_dict)
        logit = self.linear_model(X) 
        #print("liner",logit.shape)

        if self.use_fm and len(sparse_embedding_list) > 0:
            fm_input = torch.cat(sparse_embedding_list, dim=1)
            square_of_sum = torch.pow(torch.sum(fm_input, dim=1, keepdim=False), 2)
            sum_of_square = torch.sum(fm_input * fm_input, dim=1, keepdim=False)
            cross_term = 0.5 * (square_of_sum - sum_of_square)  # dim : batch_size * 4
            #print("fm", cross_term.shape)

#             logit += self.fm(fm_input) # dim : batch_size * 1


        if self.use_dnn:
            dnn_input = combined_dnn_input(
                sparse_embedding_list, dense_value_list)
            dnn_output = self.dnn(dnn_input)
            #dnn_logit = self.dnn_linear(dnn_output)
            #print("dnn_output",dnn_output.shape)
#             logit += dnn_logit # dim : batch_size * 1

        channelSize = torch.cat((logit, cross_term, dnn_output), dim=1)
        #print("channelSize",channelSize.shape)

#         logit = torch.sum(channelSize, dim=1, keepdim=False)

        m = nn.Linear(channelSize.shape[1], 128).to(self.device)
        logit = m(channelSize)

        #y_pred = self.out(logit)

        #return y_pred
        return logit
