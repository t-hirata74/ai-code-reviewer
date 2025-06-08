-- Enable pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Create test database (development database is already created via POSTGRES_DB)
CREATE DATABASE ai_code_reviewer_test;