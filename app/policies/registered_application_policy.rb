class RegisteredApplicationPolicy < ApplicationPolicy

  def index?
    # true
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end

  def destroy?
    update?
  end

  def show?
    create?
    # user.present? && (record.user == user || user.admin? || user.moderator?)
  end


end