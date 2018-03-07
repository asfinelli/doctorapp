class ConversationsController < ApplicationController
  before_action :authenticate_all!


  def new
  end

  def create
    if current_user
      recipients = User.where(id: conversation_params[:recipients])
      conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
      flash[:success] = "Your message was successfully sent!"
      redirect_to conversation_path(conversation)
    elsif current_doctor
      recipients = Doctor.where(id: conversation_params[:recipients])
      conversation = current_doctor.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
      flash[:success] = "Your message was successfully sent!"
      redirect_to conversation_path(conversation)
    end
  end

  def show
    if current_user
      @receipts = conversation.receipts_for(current_user)
      # mark conversation as read
      conversation.mark_as_read(current_user)
    elsif current_doctor
      @receipts = conversation.receipts_for(current_doctor)
      # mark conversation as read
      conversation.mark_as_read(current_doctor)
    end
  end

  def reply
    if current_user
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  elsif current_doctor
    current_doctor.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end
  end


  private
  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end
  def authenticate_all!
    if user_signed_in?
      true
    else
      authenticate_doctor!
    end
  end
end
