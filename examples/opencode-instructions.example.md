# opencode/instructions.md — Example
# Place this at .opencode/instructions.md in your project root
# Opencode reads this automatically when you run `opencode` in the project

## Project: [YOUR PROJECT NAME]

## Tech Stack
- Language: Python 3.12
- Framework: FastAPI + Pydantic v2
- Database: PostgreSQL + SQLAlchemy 2.0
- Cache: Redis
- Tests: pytest + httpx
- Deploy: Docker + Railway

## Standards
- Type hints on all functions (mypy strict)
- Async endpoints by default
- SQLAlchemy async sessions only (no sync)
- Pydantic models for all request/response schemas
- Raise HTTPException, never return error in 200 response

## Architecture
```
app/
├── api/v1/        ← FastAPI routers
├── services/      ← Business logic
├── repositories/  ← Database access
├── models/        ← SQLAlchemy models
├── schemas/       ← Pydantic schemas
└── core/          ← Config, deps, middleware
```

## Provider Strategy
- Use `--provider nvidia` (kimi-k2-5) for most tasks (FREE)
- Use `--provider anthropic --model claude-opus-4-6` for planning only
- Use local Ollama for sensitive code that shouldn't leave machine

## Commands
```bash
uvicorn app.main:app --reload    # Development
pytest                            # All tests
pytest -v -k "test_auth"         # Specific tests
alembic upgrade head              # Run migrations
alembic revision --autogenerate  # Generate migration
docker-compose up                 # Start all services
```

## Task Completion Rules
1. ALWAYS run tests before marking a task complete
2. Type check: mypy app/ must pass
3. No bare `except:` clauses — always catch specific exceptions
4. Log errors with context using structlog
