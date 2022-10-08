module Mutations
  class UpdateComment < BaseMutation
    argument :id, ID, required: true
    argument :content, String, required: false

    type Types::CommentType

    def resolve(**options)
      result = ::UpdateComment.call(comment_params: options, comment: ::Comment.find_by(id: options[:id]))
      
      if result.success?
        result.comment
      else
        nil
      end
    end
  end
end
