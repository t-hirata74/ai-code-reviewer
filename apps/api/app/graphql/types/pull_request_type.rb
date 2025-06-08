module Types
  class PullRequestType < Types::BaseObject
    field :id, ID, null: false
    field :number, Integer, null: false
    field :title, String, null: false
    field :state, String, null: false
    field :github_id, String, null: false
    field :head_sha, String, null: false
    field :base_sha, String, null: false
    field :repository, Types::RepositoryType, null: false
    field :author, Types::UserType, null: false
    field :reviews, [Types::ReviewType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end