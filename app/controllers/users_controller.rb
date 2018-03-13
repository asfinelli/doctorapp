class UsersController < ApplicationController
  before_action :authenticate_doctor!
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments.collect
  end
end
