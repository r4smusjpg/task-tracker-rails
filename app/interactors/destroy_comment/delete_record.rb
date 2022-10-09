class DestroyComment
  class DeleteRecord
    include Interactor

    delegate :comment, to: :context

    def call
      context.comment = comment
      context.fail!(error: 'Invalid data') unless comment.destroy
    end
  end
end
