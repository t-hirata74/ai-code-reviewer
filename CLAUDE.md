# AI Code Reviewer - Claude Code Instructions

## System Context
You are a senior Ruby/Rails & TypeScript engineer. Follow Ruby Style Guide and AirBnB JS style.

## Project Structure
```
ai-code-reviewer/
├─ apps/
│  ├─ web/             # Next.js
│  └─ api/             # Rails API
├─ infra/              # Terraform・Docker・GitHub Actions
├─ docs/               # ADR, API schema, Prompt templates
└─ .github/workflows/
```

## Development Flow
1. **Cmd + K → "New Chat"** : このテンプレートを System に貼付
2. 対象ファイル or ディレクトリを選択 → **Cmd + Esc** で "Explain / Refactor" を実行
3. **Diff ペイン** で Accept / Reject
4. テスト自動生成: `# write RSpec for previous diff`
5. 上限トークン監視: `claude stats` or `anthropic-ratelimit-*` header をログ出力

## Prompt Templates

### 1. 初期プロジェクトセットアップ
```
# Task
Create a monorepo project structure for ai-code-reviewer with Next.js 14 and Rails 7.1 API.
Include basic configuration files and directory structure.

# Context
- Next.js 14 (App Router) for frontend
- Rails 7.1 API-only for backend
- TypeScript + Ruby 3.3
- Directory structure should follow the monorepo pattern
- Include essential configuration files (Docker, GitHub Actions, etc.)

# Output format
Only code. No explanations.
```

### 2. バックエンド（Rails）のセットアップ
```
# Task
Set up Rails 7.1 API application with:
1. GraphQL-Ruby integration
2. PostgreSQL + pgvector configuration
3. Sidekiq + Redis setup
4. GitHub OAuth authentication
5. Basic PR webhook controller

# Context
- Rails 7.1 API-only mode
- Ruby 3.3
- PostgreSQL 16 with pgvector
- Sidekiq 7 + Redis 7
- GitHub OAuth for authentication

# Output format
Only code. No explanations.
```

### 3. フロントエンド（Next.js）のセットアップ
```
# Task
Set up Next.js 14 application with:
1. App Router configuration
2. shadcn/ui integration
3. TanStack Query setup
4. Basic dashboard layout
5. GitHub OAuth integration

# Context
- Next.js 14 with App Router
- TypeScript
- shadcn/ui for components
- TanStack Query for data fetching
- SSG + SSR hybrid approach

# Output format
Only code. No explanations.
```

### 4. インフラストラクチャのセットアップ
```
# Task
Create infrastructure configuration:
1. Docker Compose for development
2. GitHub Actions CI workflow
3. Basic Terraform configuration
4. Environment variables template

# Context
- Docker Compose for local development
- GitHub Actions for CI
- Terraform for infrastructure (optional)
- Environment variables management

# Output format
Only code. No explanations.
```

## Environment Variables
```
GITHUB_APP_WEBHOOK_SECRET=...
GITHUB_APP_PRIVATE_KEY=...
ANTHROPIC_API_KEY=...
DATABASE_URL=postgres://...
REDIS_URL=redis://...
FRONTEND_URL=https://ai-code-reviewer.dev
```

## Development Guidelines
1. 各ステップで生成されたコードを適切にレビュー
2. 必要に応じて修正を依頼
3. テストの自動生成を活用
4. 環境変数の管理に注意
5. セキュリティに配慮した設定