class ConversationsController < ApplicationController
  before_action :authenticate_all!


  def new
    if current_user
      @doctor = Doctor.find_by(id: params[:recipient_id])
    elsif current_doctor
      @user = User.find_by(id: params[:recipient_id])
    end

    def create
      if current_user
        recipients = Doctor.find_by(id: params[:recipient_id])
        conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
        flash[:success] = "Your message was successfully sent!"
        respond_to do |format|
          format.html {redirect_to conversations_path}
          format.js
        end

        elsif current_doctor
          recipients = User.find_by(id: params[:recipient_id])
          conversation = current_doctor.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
          flash[:success] = "Your message was successfully sent!"
          respond_to do |format|
            format.html {redirect_to conversation_path(conversation)}
            format.js
          end
        end
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

  def trash
    if current_user
      conversation.move_to_trash(current_user)
      redirect_to mailbox_inbox_path
    elsif current_doctor
      conversation.move_to_trash(current_doctor)
      redirect_to mailbox_inbox_path
    end
  end

  def untrash
    if current_user
      conversation.untrash(current_user)
      redirect_to mailbox_inbox_path
    elsif current_doctor
      conversation.untrash(current_doctor)
      redirect_to mailbox_inbox_path
    end
  end


def index

end

  private
  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end


  def authenticate_all!
    if user_signed_in?
      true
    else
      authenticate_doctor!
    end
  end
end
