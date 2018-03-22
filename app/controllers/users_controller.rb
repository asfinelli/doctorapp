class UsersController < ApplicationController
  before_action :authenticate_doctor!

  def index
    @users = User.all.order('name ASC')
    respond_to do |format|
      format.html # show.html.erb
      format.js
  end
end

def search
  respond_to do |format|
    format.html
    format.json { @users = User.search(params[:term]) }
  end
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
