# **Customer Behavior Analysis and Campaign Response Prediction**

## **Overview**
This project analyzes customer behavior and predicts campaign responses using a dataset from Kaggle, originally uploaded by **Ahsan Raza**. The project demonstrates an end-to-end data analysis and predictive modeling pipeline, combining SQL, Python, and Machine Learning techniques. It provides actionable insights and builds a predictive model to optimize marketing campaigns.


## **Project Structure**
The repository contains the following files:
- **`Sales_SQLQuery1.sql`**: Contains all SQL queries used for data exploration and analysis.
- **`Cleaned Dataset`**: The dataset after performing data cleaning and feature engineering.
- **`Original Dataset`**: The unaltered dataset sourced from Kaggle.
- **`Jupyter Notebook`**: Python scripts for data cleaning, feature engineering, and machine learning.
- **Visualizations**:
  - ROC Curve Comparison.
  - Confusion Matrix Heatmaps for both Logistic Regression and Random Forest models.

## **Project Steps**

### 1. **Data Collection**
- The dataset was sourced from [Kaggle](https://www.kaggle.com/datasets/ahsan81/superstore-marketing-campaign-dataset/data) and uploaded by **Ahsan Raza**.
- Data contains information about customer demographics, spending patterns, and campaign responses.

### 2. **Data Cleaning and Feature Engineering**
Performed in **Jupyter Notebook** using Python:
- **Dropped irrelevant columns** such as `dt_customer`.
- Created new features:
  - **`age`**: Calculated from the year of birth.
  - **`household_size`**: Combined `kid_home` and `teen_home`.
  - **`total_amount_spent`**: Sum of spending across all product categories.
  - **`income_to_spending_ratio`**: Ratio of total spending to income.
- Encoded categorical variables like `education` and `marital_status` using **One-Hot Encoding**.


### 3. **Data Analysis with SQL**
Performed exploratory data analysis (EDA) using SQL:
- **General Exploration**:
  - Total number of customers, average income, and unique education levels.
- **Customer Segmentation**:
  - Spending patterns by marital status and household size.
  - Age group distribution and response rates.
- **Spending Patterns**:
  - Spending by product categories and education levels.
- **Campaign Analysis**:
  - Overall response rate and its variation across income levels and marital statuses.
- **Engagement and Visits**:
  - Website visits vs. purchases.
  - Popular engagement channels like store and catalog purchases.
- **Advanced Analysis**:
  - Correlation between income and spending for customers filing complaints.
  - Customers with high recency still responding positively.



### 4. **Predictive Modeling**
Built predictive models to classify campaign responses:
- **Logistic Regression**:
  - Accuracy: **85%**
  - ROC-AUC: **0.79**
- **Random Forest**:
  - Accuracy: **86%**
  - ROC-AUC: **0.83**
  - Identified as the best-performing model due to its higher AUC score and feature importance insights.


### 5. **Visualizations**
Created visualizations to compare model performance:
- **ROC Curves**: Highlighted the trade-off between sensitivity and specificity.
- **Confusion Matrices**: Displayed classification accuracy for both Logistic Regression and Random Forest models.
- ![ROC Curve](https://github.com/SahirHussain99/Customer-Behavior-Analysis-and-Campaign-Response-Prediction/blob/main/download.png "ROC Curve Comparison")
- ![Confusion Matrix](https://github.com/SahirHussain99/Customer-Behavior-Analysis-and-Campaign-Response-Prediction/blob/main/download%20(1).png "Confusion Matrix")



### 6. **Insights and Recommendations**
#### Key Insights:
- Customers aged **30-49** with higher incomes and recent activity are more likely to respond positively.
- **Meat products** and **wines** are the highest contributors to spending.
- Store and catalog purchases drive the most engagement.
#### Recommendations:
- Target campaigns towards married customers and those with high recency.
- Invest in improving store and catalog experiences.
- Use the predictive model to prioritize customers likely to respond positively.


## **Next Steps**
- Experiment with additional models like Gradient Boosting or XGBoost.
- Enrich the dataset with external factors like seasonality or competitor pricing.


## **Acknowledgments**
- Dataset Source: **Ahsan Raza**, [Kaggle](https://www.kaggle.com/datasets/ahsan81/superstore-marketing-campaign-dataset/data).
- Tools Used:
  - **SQL**: Data analysis and pattern identification.
  - **Python**: Data cleaning, modeling, and visualization.
  - **Machine Learning**: Predictive modeling using Logistic Regression and Random Forest.


## **Contact**
Feel free to reach out for collaboration or feedback:
- **LinkedIn**: [Sahir Hussain Syed](https://www.linkedin.com/in/sahirhussainsyed/)

