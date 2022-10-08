class CreateComment
  class PrepareParams
    include Interactor

    delegate :comment_params, to: :context

    def call
      context.prepared_comment_params = prepared_comment_params
    end

    private

      def prepared_comment_params
        comment_params
      end
  end
end
