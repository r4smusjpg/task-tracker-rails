module Mutations
  module CommentMutations
    class UpdateComment < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :content, String, required: false

      type Types::Payloads::CommentPayload

      def resolve(**options)
        result = ::UpdateComment.call(comment_params: options, comment: ::Comment.find_by(id: options[:id]))
        
        if result.success?
          result.to_h
        else
          format_errors(comment: result.comment)
        end
      end
    end
  end
end
