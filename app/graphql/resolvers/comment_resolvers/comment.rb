module Resolvers
  module CommentResolvers
    class Comment < Resolvers::Base
      argument :id, ID, required: true
      
      type Types::CommentType, null: false

      def resolve(**params)
        ::Comment.find_by(id: params[:id])
      end
    end
  end
end
