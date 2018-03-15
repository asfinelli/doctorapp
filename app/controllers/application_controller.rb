class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :mailbox, :conversation

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password_confirmation, :username, :name, :dob, :phone_number, :gender, :address, :city, :state, :postal_code, :country, :admin])
  end
  
  private

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def mailbox
    if user_signed_in?
      @mailbox ||= current_user.mailbox
    elsif doctor_signed_in?
      @mailbox ||= current_doctor.mailbox
    end
  end
end
