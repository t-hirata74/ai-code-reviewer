module Types
  class RepositoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :full_name, String, null: false
    field :github_id, String, null: false
    field :webhook_configured, Boolean, null: false
    field :owner, Types::UserType, null: false
    field :pull_requests, [Types::PullRequestType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end