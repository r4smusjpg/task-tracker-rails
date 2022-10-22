module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # projects queries
    field :projects, resolver: Resolvers::ProjectResolvers::Projects
    field :project, resolver: Resolvers::ProjectResolvers::Project

    # tasks queries
    field :tasks, resolver: Resolvers::TaskResolvers::Tasks
    field :task, resolver: Resolvers::TaskResolvers::Task

    # comments queries
    field :comments, resolver: Resolvers::CommentResolvers::Comments
    field :comment, resolver: Resolvers::CommentResolvers::Comment
  end
end
