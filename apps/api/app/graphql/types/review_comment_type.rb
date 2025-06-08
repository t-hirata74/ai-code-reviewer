module Types
  class ReviewCommentType < Types::BaseObject
    field :id, ID, null: false
    field :file_path, String, null: false
    field :line_number, Integer, null: true
    field :comment, String, null: false
    field :severity, String, null: false
    field :suggestion, String, null: true
    field :review, Types::ReviewType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end