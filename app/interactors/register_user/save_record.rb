class RegisterUser
  class SaveRecord
    include Interactor

    delegate :prepared_user_params, to: :context

    def call
      context.user = user
      context.fail!(error: 'Invalid data') unless user.save
    end

    private

      def user
        @user ||= User.new(prepared_user_params)
      end
  end
end
