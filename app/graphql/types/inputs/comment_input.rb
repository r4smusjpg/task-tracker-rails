module Types
  module Inputs
    class CommentInput < Types::BaseInputObject
      argument :task_id, ID, required: true
      argument :user_id, ID, required: true
      argument :content, String, required: true
    end
  end
end
