
class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.professional?
        scope.all
      else
        scope.none
      end
    end
  end

  def index?
    user.admin? || @user.professional?
  end

  def show?
    user.admin? || @user.professional?
  end

  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def permitted_attributes
    [:description, :street, :city, :state, :number_of_tables, :number_of_chairs, :price_per_hour, :start_date, :end_date, photos: [], photos_attachments_attributes: [:id, :_destroy], place_schedules_attributes: [:id, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :start, :end, :_destroy]]
  end
end
