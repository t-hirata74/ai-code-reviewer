module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :status, String, null: false
    field :overall_score, Integer, null: false
    field :summary, String, null: true
    field :pull_request, Types::PullRequestType, null: false
    field :reviewer, Types::UserType, null: false
    field :review_comments, [Types::ReviewCommentType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end