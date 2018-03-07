class MailboxController < ApplicationController
  before_action :authenticate_all!

  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
  end

  def trash
    @trash = mailbox.trash
    @active = :trash
  end

  private

  def authenticate_all!
    if user_signed_in?
      true
    else
      authenticate_doctor!
    end
  end
end
