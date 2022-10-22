module Mutations
  class SignUp < BaseMutation
    argument :input, Types::Inputs::SignUpInput, required: true

    type Types::Payloads::SignUpPayload

    def resolve(input:)
      result = ::RegisterUser.call(user_params: input.to_h)

      if result.success?
        result.to_h
      else
        format_errors(user: result.user)
      end
    end
  end
end
