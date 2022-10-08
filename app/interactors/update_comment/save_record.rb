class UpdateComment
  class SaveRecord
    include Interactor

    delegate :comment_params, :comment to: :context

    def call
      context.comment = comment
      context.fail!('Invalid data') unless comment.update(comment_params)
     end
  end
end
