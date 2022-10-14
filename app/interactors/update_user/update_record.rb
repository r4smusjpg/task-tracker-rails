class UpdateUser
  class UpdateRecord
    include Interactor

    delegate :user_params, :user, to: :context

    def call
      context.user = user
      context.fail!(error: 'Invalid data') unless user.update(user_params)
    end
  end
end
