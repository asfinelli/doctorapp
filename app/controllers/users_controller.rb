class UsersController < ApplicationController
  before_action :authenticate_doctor!

  def index
    @users = User.search(params[:search]).order(:name).paginate(:per_page => 5, :page => params[:page])
  end


  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments.collect
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end
end
