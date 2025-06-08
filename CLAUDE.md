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
# タスク
Next.js 14とRails 7.1 APIを使用して、ai-code-reviewerのモノレポプロジェクト構造を作成してください。
基本的な設定ファイルとディレクトリ構造を含めてください。

# コンテキスト
- フロントエンドにはNext.js 14 (App Router)を使用
- バックエンドにはRails 7.1 API-onlyを使用
- TypeScript + Ruby 3.3
- ディレクトリ構造はモノレポパターンに従うこと
- 必要な設定ファイル（Docker、GitHub Actionsなど）を含めること

# 出力形式
コードのみ。説明は不要です。
```

### 2. バックエンド（Rails）のセットアップ
```
# タスク
Rails 7.1のAPIアプリケーションを以下の機能でセットアップ：
1. GraphQL-Rubyの統合
   - GraphQLを使用したAPIエンドポイントの構築
   - フロントエンドとの効率的なデータ通信

2. PostgreSQL + pgvectorの設定
   - PostgreSQL 16のデータベース設定
   - pgvector拡張機能の導入（ベクトル検索用）
   - コードレビュー結果の効率的な保存と検索

3. Sidekiq + Redisのセットアップ
   - 非同期処理のためのSidekiq設定
   - ジョブキューとしてのRedis設定
   - バックグラウンドでのコードレビュー処理

4. GitHub OAuth認証
   - GitHubアカウントでのログイン機能
   - アクセストークンの管理
   - ユーザー認証の実装

5. PR Webhookコントローラ
   - GitHubからのWebhook受信
   - PRの変更検知
   - レビュー処理の自動トリガー

# 技術スタック
- Rails 7.1（APIモード）
  - API専用の軽量なRails設定
  - フロントエンドとの分離

- Ruby 3.3
  - 最新のRuby機能を活用
  - パフォーマンスの最適化

- PostgreSQL 16 + pgvector
  - 最新のPostgreSQL機能
  - ベクトル検索による効率的なデータ検索

- Sidekiq 7 + Redis 7
  - 非同期処理の実装
  - ジョブキューの管理

- GitHub OAuth認証
  - セキュアな認証システム
  - GitHub APIとの連携

# 出力形式
コードのみを出力（説明なし）
```

### 3. フロントエンド（Next.js）のセットアップ
```
# タスク
Next.js 14アプリケーションを以下の機能でセットアップ：
1. App Routerの設定
   - 新しいApp Routerによるルーティング
   - サーバーコンポーネントの活用
   - ファイルベースのルーティング

2. shadcn/uiの統合
   - モダンなUIコンポーネントの導入
   - カスタマイズ可能なデザインシステム
   - アクセシビリティ対応

3. TanStack Queryの設定
   - データフェッチングの最適化
   - キャッシュ管理
   - サーバー状態の管理

4. 基本的なダッシュボードレイアウト
   - レスポンシブデザイン
   - コードレビュー結果の表示
   - ユーザーインターフェースの構築

5. GitHub OAuth統合
   - GitHub認証の実装
   - ユーザーセッション管理
   - アクセストークンの処理

# 技術スタック
- Next.js 14（App Router）
  - 最新のNext.js機能を活用
  - サーバーサイドレンダリング

- TypeScript
  - 型安全性の確保
  - 開発効率の向上

- shadcn/ui
  - 再利用可能なコンポーネント
  - モダンなデザイン

- TanStack Query
  - 効率的なデータ取得
  - キャッシュ管理

- SSG + SSRハイブリッドアプローチ
  - パフォーマンスの最適化
  - SEO対策

# 出力形式
コードのみを出力（説明なし）
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