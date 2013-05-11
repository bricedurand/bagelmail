class MailsController < ApplicationController
  def index
    @mails = Mail.all
    # @mails = current_user.mails
  end
end
