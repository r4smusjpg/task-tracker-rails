module Mutations
  module CommentMutations
    class CreateComment < Mutations::BaseMutation
      argument :input, Types::Inputs::CommentInput, required: true

      type Types::Payloads::CommentPayload

      def resolve(input:)
        result = ::CreateComment.call(comment_params: input.to_h)

        if result.success?
          result.to_h
        else
          format_errors(comment: result.comment)
        end
      end
    end
  end
end
