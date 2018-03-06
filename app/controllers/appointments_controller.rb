class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :authenticate_doctor!, only: [:edit, :update, :index]
  before_action :find_appointment, only: [:edit, :update, :show]

  def index
    @appointment = Appointment.where(doctor_id: nil)

  end

  def new
    @appointment = Appointment.new(user: current_user)
  end


  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    if @appointment.save!
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def show

  end


  def edit

  end


  def update
    appointment_params.merge(doctor_id: current_doctor
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render 'edit'
    end
  end


  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:name, :doctor_id, :user_id, :symptoms, :blood_pressure, :temperature, :timestamp, :medications, :follow_up)
  end
end
