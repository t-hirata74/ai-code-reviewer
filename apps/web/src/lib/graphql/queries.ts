import { gql } from 'graphql-request'

export const GET_CURRENT_USER = gql`
  query GetCurrentUser {
    currentUser {
      id
      email
      name
      github_username
      avatar_url
      created_at
      updated_at
    }
  }
`

export const GET_REPOSITORIES = gql`
  query GetRepositories {
    repositories {
      id
      name
      full_name
      github_id
      webhook_configured
      owner {
        id
        name
        github_username
      }
      created_at
      updated_at
    }
  }
`

export const GET_PULL_REQUESTS = gql`
  query GetPullRequests($repository_id: ID) {
    pullRequests(repository_id: $repository_id) {
      id
      number
      title
      state
      github_id
      head_sha
      base_sha
      repository {
        id
        name
        full_name
      }
      author {
        id
        name
        github_username
        avatar_url
      }
      created_at
      updated_at
    }
  }
`

export const GET_REVIEWS = gql`
  query GetReviews($pull_request_id: ID) {
    reviews(pull_request_id: $pull_request_id) {
      id
      status
      overall_score
      summary
      pull_request {
        id
        number
        title
        repository {
          name
          full_name
        }
      }
      reviewer {
        id
        name
        github_username
      }
      review_comments {
        id
        file_path
        line_number
        comment
        severity
        suggestion
      }
      created_at
      updated_at
    }
  }
`