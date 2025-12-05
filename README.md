SMS Text Spam Prediction

**Overview**

This project focuses on detecting spam messages in SMS text using Natural Language Processing (NLP) and Machine Learning techniques. It leverages text preprocessing, feature extraction, and classification algorithms to accurately predict whether a message is Spam or Ham (Not Spam).

**Features**

* Text preprocessing (lowercasing, tokenization, stopword removal)
* Feature extraction using TF-IDF or Bag of Words
* Model training with algorithms like Naive Bayes, Logistic Regression, or Random Forest
* Performance evaluation using Accuracy, Precision, Recall, and F1-score
* Prediction script for new SMS messages


**Project Structure**
```
SMSTextSpamPrediction/
│
├── data/                # Dataset (e.g., SMS Spam Collection)
├── notebooks/           # Jupyter notebooks for EDA and model training
├── src/                 # Source code for preprocessing and model pipeline
├── models/              # Saved trained models
├── requirements.txt     # Python dependencies
└── README.md            # Project documentation
```

**Installation**

Clone the repository:
```
git clone https://github.com/FarooqMulla/SMSTextSpamPrediction.git
cd SMSTextSpamPrediction
```

Predict a message:
```
python src/predict.py --message "Congratulations! You've won a prize."
```

**License**
This project is licensed under the MIT License.
