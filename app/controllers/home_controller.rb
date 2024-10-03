class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    if user_signed_in?
      if current_user.doctor?
        redirect_to doctor_path # Adjust this to your doctor's page route
      elsif current_user.receptionist?
        redirect_to receptionist_path # Adjust this to your receptionist's page route
      else
        redirect_to root_path # Fallback for any other roles
      end
    end
  end
end
