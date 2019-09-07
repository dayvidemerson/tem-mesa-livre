class ProfessionalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.professional?
        scope.where(user: @user)
      else
        scope.actived
      end
    end
  end

  def index?
    user.admin? || user.human_resources?
  end

  def show?
    user.admin? || user.human_resources?
  end

  def profile?
    user.professional?
  end

  def save_profile?
    user.professional?
  end

  def send_me?
    user.admin? || user.human_resources?
  end

  def permitted_attributes
    [:occupation, :company, :linkedin, :facebook, :twitter, :cellphone, :phone, :city, :state, :active, user_attributes: [:id, :name, :email]]
  end
end
