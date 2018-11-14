class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def authenticate_admin!
  unless user_signed_in? && current_user.admin?
    flash[:warning] = "You need to be an admin to have access to that!"
    redirect_to "/"
  end
end

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
end

end
