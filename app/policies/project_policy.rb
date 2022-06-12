class ProjectPolicy < ApplicationPolicy
  alias_method :project, :record

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

  def edit?
    update?
  end

  def update?
    user.present?
  end

  def destroy?
    update?
  end
end
