module Types
  module Payloads
    class CommentPayload < Types::BaseObject
      field :comment, Types::CommentType, null: true, method: :comment
      field :errors, [Types::Payloads::Error], null: true
    end
  end
end
