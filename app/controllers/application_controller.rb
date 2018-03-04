class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password_confirmation, :username, :name, :dob, :phone_number, :gender, :address, :city, :state, :postal_code, :country])
  end


end
