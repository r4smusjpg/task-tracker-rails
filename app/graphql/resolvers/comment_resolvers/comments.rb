module Resolvers
  module CommentResolvers
  class Comments < Resolvers::Base
    type [Types::CommentType], null: false

    def resolve(**_options)
      ::Comment.all
    end
  end
  end
end
