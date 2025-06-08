# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :current_user, Types::UserType, null: true, description: "Current authenticated user"
    def current_user
      context[:current_user]
    end

    field :repositories, [Types::RepositoryType], null: false, description: "User's repositories"
    def repositories
      return [] unless context[:current_user]
      context[:current_user].repositories
    end

    field :pull_requests, [Types::PullRequestType], null: false, description: "User's pull requests" do
      argument :repository_id, ID, required: false
    end
    def pull_requests(repository_id: nil)
      return [] unless context[:current_user]
      
      prs = context[:current_user].pull_requests
      prs = prs.where(repository_id: repository_id) if repository_id
      prs
    end

    field :reviews, [Types::ReviewType], null: false, description: "User's reviews" do
      argument :pull_request_id, ID, required: false
    end
    def reviews(pull_request_id: nil)
      return [] unless context[:current_user]
      
      reviews = context[:current_user].reviews
      reviews = reviews.joins(:pull_request).where(pull_requests: { id: pull_request_id }) if pull_request_id
      reviews
    end
  end
end
