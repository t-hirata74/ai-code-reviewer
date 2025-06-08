-- Enable pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Create development and test databases
CREATE DATABASE ai_code_reviewer_development;
CREATE DATABASE ai_code_reviewer_test;