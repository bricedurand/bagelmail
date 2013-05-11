class MailsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @mails = Mail.all
    # @mails = current_user.mails
  end

  def show
    @mail = Mail.find params[:id]
    # @mails = current_user.mails.find params[:id]
  end
end
