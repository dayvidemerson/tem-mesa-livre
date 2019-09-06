class RedirectController < ApplicationController
  skip_after_action :verify_authorized, only: [:redirect]
  
  def redirect
    if current_user.professional?
      redirect_to places_path
    elsif current_user.human_resources?
      redirect_to professionals_path
    else
      redirect_to places_path
    end
  end
end
