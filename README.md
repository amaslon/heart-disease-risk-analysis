# Heart Disease Risk Analysis

Exploratory data analysis, SQL analysis and machine learning classification using the UCI Heart Disease dataset.

## Project overview

This project examines demographic and clinical characteristics associated with the presence of heart disease. It demonstrates a complete data analysis workflow: data acquisition, quality assessment, cleaning, exploratory analysis, SQL querying, preprocessing, classification and model evaluation.

The machine learning model is intended only as an educational and portfolio example. It must not be used for medical diagnosis or clinical decision-making.

## Objectives

- inspect and clean medical data
- identify differences between patients with and without heart disease
- create clear and reproducible visualizations
- analyse patient groups using SQL
- build an interpretable classification model
- evaluate the model using multiple performance metrics
- discuss limitations and responsible use

## Dataset

The project uses the **Heart Disease dataset** from the UCI Machine Learning Repository.

- Instances: 303
- Input features: 13
- Target: presence or absence of heart disease
- Source: [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/45/heart+disease)
- DOI: [10.24432/C52P4X](https://doi.org/10.24432/C52P4X)
- License: CC BY 4.0

The original target contains values from 0 to 4. For binary classification:

- `0` = no heart disease
- `1` = heart disease present

## Technologies

- Python
- pandas
- NumPy
- Matplotlib
- Seaborn
- scikit-learn
- SQLite
- SQL
- JupyterLab

## Project structure

```text
heart-disease-risk-analysis/
├── data/
│   ├── raw/
│   │   └── heart_disease_uci.csv
│   └── processed/
│       ├── heart_disease_clean.csv
│       └── heart_disease.db
├── notebooks/
│   └── 01_heart_disease_analysis.ipynb
├── sql/
│   └── heart_disease_analysis.sql
├── visuals/
│   ├── heart_disease_eda_overview.png
│   ├── model_feature_coefficients.png
│   └── model_performance.png
├── README.md
└── requirements.txt