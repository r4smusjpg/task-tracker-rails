module Mutations
  class CreateComment < BaseMutation
    argument :task_id, ID, required: true
    argument :user_id, ID, required: true
    argument :content, String, required: true

    type Types::CommentType

    def resolve(**options)
      result = ::CreateComment.call(comment_params: options)

      if result.success?
        result.comment
      else
        nil
      end
    end
  end
end
