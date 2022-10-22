module Types
  module Payloads
    class SignUpPayload < Types::BaseObject
      field :current_user, Types::Payloads::CurrentUserType, null: true, method: :user
      field :errors, [Types::Payloads::Error], null: true
    end
  end
end
