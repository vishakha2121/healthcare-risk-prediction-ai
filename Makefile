# ============================================
# Healthcare Risk Prediction System - Makefile
# ============================================
# Usage: make [command]
# Example: make help, make install, make run
# ============================================

.PHONY: help install install-dev install-prod run run-dev run-prod \
        test test-coverage lint format clean migrate seed \
        docker-build docker-up docker-down docker-logs \
        train-models preprocess-data evaluate-models \
        setup-frontend build-frontend dev-frontend \
        setup-backend dev-backend \
        all reset health

# Colors for output
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

# ============================================
# HELP
# ============================================
help: ## Show this help message
	@echo ''
	@echo '$(GREEN)Healthcare Risk Prediction System - Makefile Commands$(RESET)'
	@echo ''
	@echo '$(YELLOW)Usage:$(RESET)'
	@echo '  make <command>'
	@echo ''
	@echo '$(YELLOW)Installation:$(RESET)'
	@echo '  $(GREEN)install$(RESET)          Install all dependencies'
	@echo '  $(GREEN)install-dev$(RESET)      Install development dependencies'
	@echo '  $(GREEN)install-prod$(RESET)     Install production dependencies'
	@echo ''
	@echo '$(YELLOW)Development:$(RESET)'
	@echo '  $(GREEN)run$(RESET)              Run the application'
	@echo '  $(GREEN)run-dev$(RESET)          Run in development mode'
	@echo '  $(GREEN)run-prod$(RESET)         Run in production mode'
	@echo '  $(GREEN)dev-backend$(RESET)      Start backend server only'
	@echo '  $(GREEN)dev-frontend$(RESET)     Start frontend server only'
	@echo ''
	@echo '$(YELLOW)Testing:$(RESET)'
	@echo '  $(GREEN)test$(RESET)             Run all tests'
	@echo '  $(GREEN)test-coverage$(RESET)    Run tests with coverage report'
	@echo '  $(GREEN)lint$(RESET)             Run linters'
	@echo '  $(GREEN)format$(RESET)           Format code'
	@echo ''
	@echo '$(YELLOW)Docker:$(RESET)'
	@echo '  $(GREEN)docker-build$(RESET)     Build Docker images'
	@echo '  $(GREEN)docker-up$(RESET)        Start Docker containers'
	@echo '  $(GREEN)docker-down$(RESET)      Stop Docker containers'
	@echo '  $(GREEN)docker-logs$(RESET)      View Docker logs'
	@echo ''
	@echo '$(YELLOW)Database:$(RESET)'
	@echo '  $(GREEN)migrate$(RESET)          Run database migrations'
	@echo '  $(GREEN)seed$(RESET)             Seed database with sample data'
	@echo '  $(GREEN)reset-db$(RESET)         Reset database (drop and recreate)'
	@echo ''
	@echo '$(YELLOW)Machine Learning:$(RESET)'
	@echo '  $(GREEN)train-models$(RESET)     Train ML models'
	@echo '  $(GREEN)preprocess-data$(RESET)  Preprocess dataset'
	@echo '  $(GREEN)evaluate-models$(RESET)  Evaluate model performance'
	@echo ''
	@echo '$(YELLOW)Maintenance:$(RESET)'
	@echo '  $(GREEN)clean$(RESET)            Clean temporary files'
	@echo '  $(GREEN)reset$(RESET)            Reset entire project'
	@echo '  $(GREEN)health$(RESET)           Check system health'
	@echo '  $(GREEN)all$(RESET)              Install, setup, and run everything'
	@echo ''

# ============================================
# INSTALLATION
# ============================================
install: install-backend install-frontend ## Install all dependencies
	@echo "$(GREEN)✅ All dependencies installed$(RESET)"

install-dev: install-backend-dev install-frontend ## Install development dependencies
	@echo "$(GREEN)✅ Development dependencies installed$(RESET)"

install-prod: install-backend-prod install-frontend-prod ## Install production dependencies
	@echo "$(GREEN)✅ Production dependencies installed$(RESET)"

install-backend:
	@echo "$(YELLOW)📦 Installing backend dependencies...$(RESET)"
	cd backend && python -m venv venv
	cd backend && . venv/bin/activate && pip install -r requirements.txt

install-backend-dev:
	@echo "$(YELLOW)📦 Installing backend dev dependencies...$(RESET)"
	cd backend && python -m venv venv
	cd backend && . venv/bin/activate && pip install -r requirements-dev.txt || pip install -r requirements.txt
	cd backend && . venv/bin/activate && pip install pytest pytest-cov black flake8 mypy

install-frontend:
	@echo "$(YELLOW)📦 Installing frontend dependencies...$(RESET)"
	cd frontend && npm install

install-frontend-dev:
	@echo "$(YELLOW)📦 Installing frontend dev dependencies...$(RESET)"
	cd frontend && npm install --include=dev

# ============================================
# RUNNING
# ============================================
run: run-dev ## Run the application (default: dev)

run-dev: ## Run in development mode
	@echo "$(GREEN)🚀 Starting application in development mode...$(RESET)"
	@echo "$(YELLOW)Backend: http://localhost:8000$(RESET)"
	@echo "$(YELLOW)Frontend: http://localhost:3000$(RESET)"
	@echo "$(YELLOW)API Docs: http://localhost:8000/docs$(RESET)"
	@make -j2 dev-backend dev-frontend

run-prod: ## Run in production mode
	@echo "$(GREEN)🚀 Starting application in production mode...$(RESET)"
	@docker-compose -f docker-compose.yml --profile production up -d
	@echo "$(GREEN)✅ Production services started$(RESET)"

dev-backend: ## Start backend server only
	@echo "$(YELLOW)🔧 Starting backend server...$(RESET)"
	cd backend && . venv/bin/activate && uvicorn main:app --reload --host 0.0.0.0 --port 8000

dev-frontend: ## Start frontend server only
	@echo "$(YELLOW)🔧 Starting frontend server...$(RESET)"
	cd frontend && npm run dev -- --host 0.0.0.0

# ============================================
# TESTING
# ============================================
test: ## Run all tests
	@echo "$(YELLOW)🧪 Running tests...$(RESET)"
	cd backend && . venv/bin/activate && pytest tests/
	cd frontend && npm test

test-coverage: ## Run tests with coverage report
	@echo "$(YELLOW)🧪 Running tests with coverage...$(RESET)"
	cd backend && . venv/bin/activate && pytest --cov=app tests/ --cov-report=html
	@echo "$(GREEN)✅ Coverage report generated in backend/htmlcov/index.html$(RESET)"

lint: ## Run linters
	@echo "$(YELLOW)🔍 Running linters...$(RESET)"
	cd backend && . venv/bin/activate && flake8 app/
	cd frontend && npm run lint

format: ## Format code
	@echo "$(YELLOW)📝 Formatting code...$(RESET)"
	cd backend && . venv/bin/activate && black app/
	cd frontend && npm run format

# ============================================
# DOCKER
# ============================================
docker-build: ## Build Docker images
	@echo "$(YELLOW)🐳 Building Docker images...$(RESET)"
	docker-compose build

docker-up: ## Start Docker containers
	@echo "$(YELLOW)🐳 Starting Docker containers...$(RESET)"
	docker-compose up -d
	@echo "$(GREEN)✅ Containers started$(RESET)"
	@echo "$(YELLOW)Frontend: http://localhost:3000$(RESET)"
	@echo "$(YELLOW)Backend: http://localhost:8000$(RESET)"
	@echo "$(YELLOW)API Docs: http://localhost:8000/docs$(RESET)"
	@echo "$(YELLOW)PGAdmin: http://localhost:5050$(RESET)"

docker-down: ## Stop Docker containers
	@echo "$(YELLOW)🐳 Stopping Docker containers...$(RESET)"
	docker-compose down
	@echo "$(GREEN)✅ Containers stopped$(RESET)"

docker-down-v: ## Stop Docker containers and remove volumes
	@echo "$(YELLOW)🐳 Stopping Docker containers and removing volumes...$(RESET)"
	docker-compose down -v
	@echo "$(GREEN)✅ Containers stopped and volumes removed$(RESET)"

docker-logs: ## View Docker logs
	@echo "$(YELLOW)📋 Viewing Docker logs...$(RESET)"
	docker-compose logs -f

docker-restart: docker-down docker-up ## Restart Docker containers

docker-clean: ## Clean Docker resources
	@echo "$(YELLOW)🧹 Cleaning Docker resources...$(RESET)"
	docker system prune -a
	docker volume prune

# ============================================
# DATABASE
# ============================================
migrate: ## Run database migrations
	@echo "$(YELLOW)🗄️ Running database migrations...$(RESET)"
	cd backend && . venv/bin/activate && alembic upgrade head
	@echo "$(GREEN)✅ Migrations complete$(RESET)"

seed: ## Seed database with sample data
	@echo "$(YELLOW)🌱 Seeding database...$(RESET)"
	cd backend && . venv/bin/activate && python scripts/generate_sample_data.py
	@echo "$(GREEN)✅ Database seeded$(RESET)"

reset-db: ## Reset database (drop and recreate)
	@echo "$(YELLOW)⚠️  Resetting database...$(RESET)"
	cd backend && . venv/bin/activate && alembic downgrade base
	cd backend && . venv/bin/activate && alembic upgrade head
	@make seed
	@echo "$(GREEN)✅ Database reset complete$(RESET)"

# ============================================
# MACHINE LEARNING
# ============================================
train-models: ## Train ML models
	@echo "$(YELLOW)🧠 Training ML models...$(RESET)"
	cd backend && . venv/bin/activate && python scripts/train_models.py
	@echo "$(GREEN)✅ Models trained and saved$(RESET)"

preprocess-data: ## Preprocess dataset
	@echo "$(YELLOW)📊 Preprocessing data...$(RESET)"
	cd backend && . venv/bin/activate && python scripts/preprocess_data.py
	@echo "$(GREEN)✅ Data preprocessed$(RESET)"

evaluate-models: ## Evaluate model performance
	@echo "$(YELLOW)📈 Evaluating models...$(RESET)"
	cd backend && . venv/bin/activate && python scripts/evaluate_models.py
	@echo "$(GREEN)✅ Evaluation complete$(RESET)"

# ============================================
# MAINTENANCE
# ============================================
clean: ## Clean temporary files
	@echo "$(YELLOW)🧹 Cleaning temporary files...$(RESET)"
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".mypy_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	find . -type f -name "*.pyo" -delete 2>/dev/null || true
	rm -rf frontend/node_modules/.cache 2>/dev/null || true
	rm -rf frontend/dist 2>/dev/null || true
	rm -rf backend/htmlcov 2>/dev/null || true
	@echo "$(GREEN)✅ Clean complete$(RESET)"

reset: clean docker-down ## Reset entire project
	@echo "$(YELLOW)⚠️  Resetting entire project...$(RESET)"
	rm -rf backend/venv 2>/dev/null || true
	rm -rf frontend/node_modules 2>/dev/null || true
	rm -rf frontend/package-lock.json 2>/dev/null || true
	rm -rf backend/models/*.pkl 2>/dev/null || true
	@echo "$(YELLOW)📦 Reinstalling dependencies...$(RESET)"
	@make install
	@echo "$(YELLOW)🗄️ Setting up database...$(RESET)"
	@make reset-db
	@echo "$(YELLOW)🧠 Training models...$(RESET)"
	@make train-models
	@echo "$(GREEN)✅ Project reset complete$(RESET)"

health: ## Check system health
	@echo "$(YELLOW)🩺 Checking system health...$(RESET)"
	@echo "$(YELLOW)Python version:$(RESET)" && python --version 2>/dev/null || echo "❌ Python not found"
	@echo "$(YELLOW)Node version:$(RESET)" && node --version 2>/dev/null || echo "❌ Node not found"
	@echo "$(YELLOW)Docker version:$(RESET)" && docker --version 2>/dev/null || echo "❌ Docker not found"
	@echo "$(YELLOW)PostgreSQL:$(RESET)" && docker ps | grep postgres || echo "❌ PostgreSQL not running"
	@echo "$(YELLOW)Backend:$(RESET)" && curl -s http://localhost:8000/health || echo "❌ Backend not running"
	@echo "$(YELLOW)Frontend:$(RESET)" && curl -s http://localhost:3000 || echo "❌ Frontend not running"

# ============================================
# COMPLETE SETUP
# ============================================
all: install preprocess-data train-models migrate seed run-dev ## Complete setup

setup: install preprocess-data train-models migrate seed ## Setup everything but don't run

# ============================================
# DEVELOPMENT HELPERS
# ============================================
shell-backend: ## Open backend shell
	cd backend && . venv/bin/activate && bash

shell-frontend: ## Open frontend shell
	cd frontend && bash

shell-db: ## Open database shell
	docker exec -it healthcare-postgres psql -U healthcare_user -d healthcare_db

# ============================================
# PROJECT INFO
# ============================================
info: ## Show project information
	@echo "$(GREEN)🏥 Healthcare Risk Prediction System$(RESET)"
	@echo "$(YELLOW)Version:$(RESET) 1.0.0"
	@echo "$(YELLOW)Author:$(RESET) Vishakha"
	@echo "$(YELLOW)Repository:$(RESET) https://github.com/vishakha2121/healthcare-risk-prediction-ai"
	@echo "$(YELLOW)Documentation:$(RESET) https://github.com/vishakha2121/healthcare-risk-prediction-ai#readme"
	@echo ""
	@echo "$(YELLOW)Services:$(RESET)"
	@echo "  - Backend API: http://localhost:8000"
	@echo "  - API Docs: http://localhost:8000/docs"
	@echo "  - Frontend: http://localhost:3000"
	@echo "  - PgAdmin: http://localhost:5050"
	@echo "  - PostgreSQL: localhost:5432"

# ============================================
# DEFAULT TARGET
# ============================================
.DEFAULT_GOAL := help