class UserSessionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def index
    @appointment = Appointment.where(user_id: current_user.id).where.not(doctor_id: nil )
  end
end
