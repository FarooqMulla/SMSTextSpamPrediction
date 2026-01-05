**SMS Text Spam Prediction**

A machine‑learning based project that detects whether an incoming SMS message is **Spam** or **Ham (Not Spam)**.  
This repository includes data preprocessing, feature engineering, model training, evaluation, and a prediction interface for classifying new text messages.

**Overview**

This project provides an end‑to‑end pipeline for SMS spam detection using classic NLP techniques and supervised learning models. It is designed for clarity, extensibility, and experimentation, enabling developers and researchers to quickly iterate and test different models.

**Features**

- Text preprocessing:
  - Cleaning, tokenization, stopword removal
  - Stemming or lemmatization
- Feature extraction:
  - Bag‑of‑Words (BoW)
  - TF‑IDF Vectorization
- Supervised ML models:
  - Naive Bayes
  - Logistic Regression
  - Support Vector Machines (SVM)
- Evaluation metrics:
  - Accuracy
  - Precision, Recall, F1‑Score
  - Confusion matrix
- Simple script or notebook to classify new SMS messages.


**Installation**

Clone the repository:
```
git clone https://github.com/FarooqMulla/SMSTextSpamPrediction.git
cd SMSTextSpamPrediction
```

**Create a Virtual Environments (recommended)**
```
python3 -m venv .venv
source .venv/bin/activate
```

**Install Dependencies**
```
pip install -r requirements.txt
```

**Training Model**
```
python src/train.py --data data/spam.csv
```
This will:
- preprocess text
- extract features
- train the classifier
- save the model and vectorizer under models/-0

**Predict New Messages**

Predict a message:
```
python src/predict.py --message "Congratulations! You've won a prize."
```

Predict from a file:
```
python src/predict.py --file data/sample_messages.txt
```

**License**

This project is licensed under the MIT License.
