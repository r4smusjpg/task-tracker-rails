class UserPolicy < ApplicationPolicy
  def show?
    user.present?
  end

  def new?
    create?
  end

  def create?
    !user.present?
  end

  def edit?
    update?
  end

  def update?
    user.present?
  end
end
