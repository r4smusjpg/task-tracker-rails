module Mutations
  module CommentMutations
    class CreateComment < Mutations::BaseMutation
      argument :input, Types::Inputs::CommentInput, required: true

      type Types::CommentType

      def resolve(input:)
        result = ::CreateComment.call(comment_params: input.to_h)

        if result.success?
          result.comment
        else
          nil
        end
      end
    end
  end
end
