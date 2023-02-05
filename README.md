# kill_time_detection

* ACM CHI 2023 paper "Are You Killing Time? Predicting Smartphone Users’ Time-killing Moments via Fusion of Smartphone Sensor Data and Screenshots"

This is the repository demonstrates the kill time detection in the paper. We provided the model structure and training weight, which you can download from the Rleases. However, according to the IRB policy, we are not able to provide the training dataset that we trained on our model. Therefore, you would like to collected your own screenshots to train the model. For the inference, we gave few screenshots as example that we created. 


# Requirements

- [PyTorch](https://pytorch.org/) (Container Version 21.06 is recommended) 


# Table Of Contents
-  [How to use](#how-to-use)
-  [In Details](#in-details)
-  [Contributing](#contributing)
-  [Acknowledgments](#acknowledgments)

# How to use   
- First, store your own screenshots in the `datasets/screenshots` folders and the corresponding sensor data in the csv file in `datasets/sensor`. More folders detail please see [In Details](#in-details).

- Second, run `create_frame.py` to generate folders storing the 30 seconds window of screenshots as one training data point.

- Third, run `create_dataset.py` to generate train, val, and test dataset.

- Fourth, run `H5.py` to generate H5 file, which speed up the training precess in the large scale of screenshots data.  

- Fifth, to train the sensor model, run `mlp_varlen.py`. To train the screenshot model, run `cnn_varlen.py`. In both file, you would like to modify the file path for the H5 file and csv file 


```python
# mlp_varlen.py

csv_path = "sensor_log.csv" # your sensor data path 
h5_train_path = 'train.h5' # your file path 
h5_val_path = 'val.h5' # your file path 

```

```python
# cnn_varlen.py

h5_train_path = 'train.h5' # your file path 
h5_val_path = 'val.h5' # your file path 

```
- Sixth, to train the fusion model, run `fusion_varlen.py`. In the `fusion_varlen.py`, you have to assign paths of dataset and weights that you train from the `mlp_varlen.py` and `cnn_varlen.py`.


```python
# fusion_varlen.py

h5_train_path = "h5" # your file path 
h5_val_path = ".h5" # your file path 
cnn_encoder_path = '.pth' # your weight from cnn_varlen.py.
cnn_decoder_path = '.pth' # your weight from cnn_varlen.py.
mlp_encoder_path = '.pth' # your weight from mlp_varlen.py.

```

- Last, to inference, run the `predictionCNN.py`, `predictionFusion.py`, and `predictionMLP.py`. Remember change the weight and the test set path.



# In Details
```
├──  weight
│    └── rnn_decoder_cnn1.pth  - download the weight from Rleases.
│    └── rnn_decoder_fusion1.pth - download the weight from Rleases.
│    └── rnn_decoder_mlp1.pth - download the weight from Rleases.
│    
│    
├── utils
│    ├── deepfm.py
│    └── functions.py
│    
│    
│ 
├──  datasets  - here's the datasets folder that is responsible for all data handling.
│    └── screenshots
│        ├── 0 - all the screenshots labeled as 
│        ├── 1 - all the screenshots labeled as 
│        ├── 2 - all the screenshots labeled as 
│        └── 3 - all the screenshots labeled as 
│    └── sensor  
│        └── .csv
│
├── H5.py - creat h5 file.
│
├── create_dataset.py
│
├── create_frame.py
│
├── cnn_varlen.py
│   
├── mlp_varlen.py
│
├── fusion_varlen.py          
│  
├── predictionCNN.py
│ 
├── predictionFusion.py
│ 
└── predictionMLP.py				

```



# Contributing



# Acknowledgments


