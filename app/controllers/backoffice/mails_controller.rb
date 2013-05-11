class Backoffice::MailsController < ApplicationController
  layout 'backoffice'

  def index
    @mails = Mail.all
  end

  def show
    @mail = Mail.find(params[:id])
  end

  def new
    @mail = Mail.new
    3.times.each { @mail.attachments.build }
  end

  def create
    @mail = Mail.new(params[:mail])
    if @mail.save
      redirect_to [:backoffice, @mail], :notice => "Successfully created mail."
    else
      render :action => 'new'
    end
  end

  def edit
    @mail = Mail.find(params[:id])
  end

  def update
    @mail = Mail.find(params[:id])
    if @mail.update_attributes(params[:mail])
      redirect_to [:backoffice, @mail], :notice  => "Successfully updated mail."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @mail = Mail.find(params[:id])
    @mail.destroy
    redirect_to backoffice_mails_url, :notice => "Successfully destroyed mail."
  end
end
