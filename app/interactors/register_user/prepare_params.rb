class RegisterUser
  class PrepareParams
    include Interactor

    delegate :user_params, to: :context

    def call
      context.prepared_user_params = prepared_user_params
    end

    private

      def prepared_user_params
        user_params
      end
  end
end
