class CommentPolicy < ApplicationPolicy
  alias_method :comment, :record

  def create?
    comment.task.project.user_ids.include?(user.id)
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    comment.user.id == user.id
  end
end
