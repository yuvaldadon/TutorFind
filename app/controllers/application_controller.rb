class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Whitelist for Devise form
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
    # filter allowed parameters from controller sign up form
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) }
    end
end
