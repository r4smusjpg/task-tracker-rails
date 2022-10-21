module Mutations
  class SignUp < BaseMutation
    argument :input, Types::Inputs::SignUpInput, required: true

    type Types::Payloads::SignUpPayload

    def resolve(input:)
      sign_up = ::RegisterUser.call(user_params: input.to_h)

      if sign_up.success?
        sign_up.to_h
      else
        format_errors user: sign_up.user
      end
    end
  end
end
