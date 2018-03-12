class DoctorSessionsController < ApplicationController
  before_action :authenticate_doctor!

  def show
    @doctor = current_doctor
  end
  def index
    @appointment = Appointment.where(doctor_id: current_doctor.id)
  end

end
