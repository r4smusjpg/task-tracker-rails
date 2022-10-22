module Mutations
  module CommentMutations
    class DestroyComment < Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::Payloads::CommentPayload

      def resolve(**options)
        result = ::DestroyComment.call(comment: ::Comment.find_by(id: options[:id]))

        if result.success?
          result.to_h
        else
          nil
        end
      end
    end
  end
end
