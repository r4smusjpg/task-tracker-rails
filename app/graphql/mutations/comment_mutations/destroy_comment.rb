module Mutations
  module CommentMutations
    class DestroyComment < Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::CommentType

      def resolve(**options)
        result = ::DestroyComment.call(comment: ::Comment.find_by(id: options[:id]))

        if result.success?
          result.comment
        else
          nil
        end
      end
    end
  end
end
