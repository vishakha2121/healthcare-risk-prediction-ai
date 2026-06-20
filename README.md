# 🏥 AI Healthcare Risk Prediction & Clinical Decision Support System

[![Python Version](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.95+-green.svg)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-18.2+-61DAFB.svg)](https://reactjs.org/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## 📋 Table of Contents
- [Overview](#-overview)
- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [Project Structure](#-project-structure)
- [Installation & Setup](#-installation--setup)
- [Running the Application](#-running-the-application)
- [API Documentation](#-api-documentation)
- [Machine Learning Models](#-machine-learning-models)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

This is a **complete end-to-end AI-powered healthcare risk prediction system** that helps healthcare professionals assess patient risks, predict disease probabilities, and make informed clinical decisions. The system leverages machine learning algorithms to analyze patient data and provide actionable insights with full explainability.

### 🎬 Key Highlights
- ✅ **Patient Risk Scoring** - Calculate comprehensive risk scores
- ✅ **Disease Prediction** - Predict diabetes, heart disease, and hypertension
- ✅ **Model Explainability** - Understand why predictions are made
- ✅ **Secure API** - JWT authentication & role-based access
- ✅ **Interactive Dashboard** - Beautiful React UI with real-time updates
- ✅ **ML Interpretability** - SHAP and LIME explanations
- ✅ **Imbalanced Data Handling** - SMOTE and class weight techniques

---

## ✨ Features

### 🔐 Authentication & Authorization
- JWT token-based authentication
- Role-based access control (Admin, Doctor, Researcher)
- Secure password hashing with bcrypt
- Session management

### 👨‍⚕️ Patient Management
- Complete CRUD operations
- Advanced search and filtering
- Patient risk summary cards
- Medical history tracking
- Family history documentation

### 🧠 Disease Prediction
- **Diabetes Prediction** - Based on glucose, BMI, age, etc.
- **Heart Disease Prediction** - Based on blood pressure, cholesterol, etc.
- **Hypertension Prediction** - Based on lifestyle and medical factors
- **Real-time probability scores** with confidence intervals

### 📊 Risk Scoring System
- **Overall Risk Score** (0-100)
- **Cardiovascular Risk** assessment
- **Metabolic Risk** evaluation
- **Lifestyle Risk** analysis
- **Genetic Risk** factors

### 📈 Model Explainability
- **Feature Importance** charts and graphs
- **SHAP Force Plots** for individual predictions
- **LIME Explanations** for local interpretability
- **Contribution Analysis** for each feature

### 📊 Interactive Dashboard
- **Real-time Analytics** - Total patients, predictions, risk distribution
- **Charts & Graphs** - Risk distribution, disease trends
- **Model Performance Metrics** - Accuracy, precision, recall
- **Recent Activity Feed** - Latest predictions and updates

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

### Database
| Technology | Version | Purpose |
|------------|---------|---------|
| **PostgreSQL** | 14+ | Production database (recommended) |
| **SQLite** | 3.0+ | Development database |

### DevOps
| Technology | Version | Purpose |
|------------|---------|---------|
| **Docker** | 24+ | Containerization |
| **Docker Compose** | 2.0+ | Multi-container orchestration |
| **Git** | Latest | Version control |
| **GitHub Actions** | Latest | CI/CD pipelines |

---

## 📂 Project Structure
# Windows
python -m venv venv
venv\Scripts\activate
cd backend
pip install -r requirements.txt