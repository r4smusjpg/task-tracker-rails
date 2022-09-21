class CommentPolicy < ApplicationPolicy
  alias_method :comment, :record

  def create?
    comment.task.project.user_ids.include?(user.id)
  end

  def edit?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
