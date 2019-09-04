<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_policy"
<% end -%>

<% module_namespacing do -%>
class <%= singular_table_name.camelize %>Policy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.human_resources?
        scope.all
      else
        scope.none
      end
    end
  end

  def index?
    user.admin?
  end

  def show?
    user.admin?
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
  end
end
<% end -%>