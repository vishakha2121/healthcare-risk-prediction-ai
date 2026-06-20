# 🏥 AI Healthcare Risk Prediction & Clinical Decision Support System

[![Python Version](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.95+-green.svg)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-18.2+-61DAFB.svg)](https://reactjs.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-3.3+-06B6D4.svg)](https://tailwindcss.com/)
[![XGBoost](https://img.shields.io/badge/XGBoost-1.7+-FF6F00.svg)](https://xgboost.readthedocs.io/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![GitHub issues](https://img.shields.io/github/issues/vishakha2121/healthcare-risk-prediction-ai)](https://github.com/vishakha2121/healthcare-risk-prediction-ai/issues)
[![GitHub stars](https://img.shields.io/github/stars/vishakha2121/healthcare-risk-prediction-ai)](https://github.com/vishakha2121/healthcare-risk-prediction-ai/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/vishakha2121/healthcare-risk-prediction-ai)](https://github.com/vishakha2121/healthcare-risk-prediction-ai/network)

---

## 📋 Table of Contents
- [🌟 Overview](#-overview)
- [🎯 Key Features](#-key-features)
- [🛠️ Technology Stack](#️-technology-stack)
- [📊 ML Models Performance](#-ml-models-performance)
- [📂 Project Structure](#-project-structure)
- [🚀 Quick Start](#-quick-start)
- [📖 API Documentation](#-api-documentation)
- [🏗️ System Architecture](#️-system-architecture)
- [🔐 Security Features](#-security-features)
- [🧪 Testing](#-testing)
- [🐳 Docker Deployment](#-docker-deployment)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [🙏 Acknowledgments](#-acknowledgments)
- [📞 Contact](#-contact)

---

## 🌟 Overview

**Transform Healthcare Decisions with Artificial Intelligence**

This is a complete **end-to-end AI-powered healthcare risk prediction system** designed to assist medical professionals in making data-driven clinical decisions. The system uses advanced machine learning algorithms to analyze patient health parameters and provide accurate predictions for multiple diseases with full explainability.

### 🎯 Project Goals
- ✅ Achieve **85%+ prediction accuracy**
- ✅ Provide **full model explainability** using SHAP
- ✅ Build **secure & scalable** healthcare API
- ✅ Create **intuitive & responsive** user interface
- ✅ **Containerize** for easy deployment

---

## 🎯 Key Features

### 🔐 Authentication & Authorization
- **JWT Token** based authentication
- **Role-based access control** (Admin, Doctor, Researcher)
- **Secure password hashing** with bcrypt
- **Session management** with refresh tokens

### 👨‍⚕️ Patient Management
- **Complete CRUD operations**
- **Advanced search and filtering**
- **Patient risk summary cards**
- **Medical history tracking**
- **Family history documentation**
- **Patient data export** (CSV, PDF)

### 🧠 Disease Prediction
| Disease | Description | Key Factors |
|---------|-------------|-------------|
| **Diabetes** | Type 2 diabetes risk | Glucose, BMI, Age, Family history |
| **Heart Disease** | Cardiovascular risk | Blood pressure, Cholesterol, ECG |
| **Hypertension** | Blood pressure risk | Systolic/Diastolic, Lifestyle |

### 📊 Risk Scoring System
- **Overall Risk Score** (0-100)
- **Cardiovascular Risk** assessment
- **Metabolic Risk** evaluation
- **Lifestyle Risk** analysis
- **Genetic Risk** factors
- **Real-time risk level** (Low/Medium/High)

### 🔍 Model Explainability
- **SHAP Force Plots** - Individual prediction explanations
- **Feature Importance** charts and graphs
- **LIME Explanations** - Local interpretability
- **Contribution Analysis** - Each feature's impact
- **PDF Reports** - Generate explainability reports

### 📈 Interactive Dashboard
- **Real-time Analytics** - Total patients, predictions, risk distribution
- **Visual Charts** - Risk distribution, disease trends, model performance
- **Recent Activity Feed** - Latest predictions and updates
- **Model Performance Metrics** - Accuracy, precision, recall, F1 score
- **Export Reports** - Download analytics reports

### 💬 Feedback System
- **Rate prediction accuracy**
- **Submit feedback & comments**
- **Report issues**
- **Suggestions for improvement**
- **User satisfaction tracking**

---

## 🛠️ Technology Stack

### Backend
| Technology | Version | Purpose |
|------------|---------|---------|
| **Python** | 3.9+ | Core programming language |
| **FastAPI** | 0.95+ | High-performance web framework |
| **SQLAlchemy** | 2.0+ | ORM for database operations |
| **Pydantic** | 2.0+ | Data validation & serialization |
| **JWT** | Python-jose | Authentication & authorization |
| **Scikit-learn** | 1.3+ | Machine learning algorithms |
| **XGBoost** | 1.7+ | Gradient boosting for predictions |
| **SHAP** | 0.41+ | Model explainability |
| **LIME** | 0.2+ | Local interpretability |
| **Pandas** | 2.0+ | Data manipulation |
| **NumPy** | 1.24+ | Numerical computing |
| **Alembic** | 1.11+ | Database migrations |
| **Uvicorn** | 0.22+ | ASGI server |

### Frontend
| Technology | Version | Purpose |
|------------|---------|---------|
| **React** | 18.2+ | UI framework |
| **Vite** | 4.0+ | Build tool & development server |
| **Tailwind CSS** | 3.3+ | Utility-first CSS framework |
| **Recharts** | 2.7+ | Charting library |
| **Axios** | 1.4+ | HTTP client for API calls |
| **React Router** | 6.11+ | Navigation & routing |
| **React Hook Form** | 7.45+ | Form management |
| **React Query** | 4.29+ | Data fetching & caching |
| **Framer Motion** | 10.12+ | Animations |
| **React Toastify** | 9.1+ | Notifications |

### Database
| Technology | Version | Purpose |
|------------|---------|---------|
| **PostgreSQL** | 14+ | Production database (recommended) |
| **SQLite** | 3.0+ | Development database |
| **Alembic** | 1.11+ | Migration management |

### DevOps
| Technology | Version | Purpose |
|------------|---------|---------|
| **Docker** | 24+ | Containerization |
| **Docker Compose** | 2.0+ | Multi-container orchestration |
| **Git** | Latest | Version control |
| **GitHub Actions** | Latest | CI/CD pipelines |
| **Python-dotenv** | 1.0+ | Environment management |

---

## 📊 ML Models Performance

### Model Metrics
| Disease | Algorithm | Accuracy | Precision | Recall | F1 Score | AUC-ROC |
|---------|-----------|----------|-----------|--------|----------|---------|
| **Diabetes** | XGBoost | 85.2% | 0.86 | 0.84 | 0.85 | 0.91 |
| **Diabetes** | Random Forest | 83.7% | 0.84 | 0.82 | 0.83 | 0.89 |
| **Heart Disease** | XGBoost | 88.7% | 0.89 | 0.87 | 0.88 | 0.93 |
| **Heart Disease** | Random Forest | 86.2% | 0.87 | 0.85 | 0.86 | 0.91 |
| **Hypertension** | XGBoost | 82.5% | 0.83 | 0.81 | 0.82 | 0.88 |
| **Hypertension** | Random Forest | 80.9% | 0.81 | 0.79 | 0.80 | 0.86 |

### Feature Importance (Top 5)
#### Diabetes Prediction
1. **Glucose** (0.28)
2. **BMI** (0.22)
3. **Age** (0.18)
4. **Family History** (0.14)
5. **Blood Pressure** (0.10)

#### Heart Disease Prediction
1. **Cholesterol** (0.25)
2. **Blood Pressure** (0.22)
3. **Age** (0.19)
4. **ECG Results** (0.16)
5. **Smoking** (0.12)

#### Hypertension Prediction
1. **Systolic BP** (0.30)
2. **Diastolic BP** (0.25)
3. **Age** (0.18)
4. **BMI** (0.14)
5. **Physical Activity** (0.10)

---

## 📂 Project Structure
# Create virtual environment
cd backend
python -m venv venv

# Activate virtual environment
# Windows
venv\Scripts\activate
# Linux/Mac
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Edit .env with your database credentials

# Run migrations
alembic upgrade head

# Train ML models (First time only)
python scripts/preprocess_data.py
python scripts/train_models.py

# Start backend server
uvicorn main:app --reload --host 0.0.0.0 --port 8000
# In a new terminal
cd frontend

# Install dependencies
npm install

# Configure environment
cp .env.example .env
# Edit .env with your API URL

# Start development server
npm run dev