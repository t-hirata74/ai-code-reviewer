export interface User {
  id: string
  email: string
  name?: string
  github_username: string
  avatar_url?: string
  created_at: string
  updated_at: string
}

export interface Repository {
  id: string
  name: string
  full_name: string
  github_id: string
  webhook_configured: boolean
  owner: User
  pull_requests: PullRequest[]
  created_at: string
  updated_at: string
}

export interface PullRequest {
  id: string
  number: number
  title: string
  state: 'open' | 'closed' | 'merged'
  github_id: string
  head_sha: string
  base_sha: string
  repository: Repository
  author: User
  reviews: Review[]
  created_at: string
  updated_at: string
}

export interface Review {
  id: string
  status: 'pending' | 'completed' | 'failed'
  overall_score: number
  summary?: string
  pull_request: PullRequest
  reviewer: User
  review_comments: ReviewComment[]
  created_at: string
  updated_at: string
}

export interface ReviewComment {
  id: string
  file_path: string
  line_number?: number
  comment: string
  severity: 'info' | 'warning' | 'error' | 'critical'
  suggestion?: string
  review: Review
  created_at: string
  updated_at: string
}