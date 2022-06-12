class TaskPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    index?
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def update?
    task.project.id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end

