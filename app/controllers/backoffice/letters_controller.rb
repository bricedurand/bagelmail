class Backoffice::LettersController < ApplicationController
  skip_before_filter :authenticate_user!
  http_basic_authenticate_with name: "agent", password: "password"
  layout 'backoffice'

  def index
    @letters = Letter.all
  end

  def show
    @letter = Letter.find(params[:id])
  end

  def new
    @letter = Letter.new
    3.times.each { @letter.attachments.build }
  end

  def create
    @letter = Letter.new(params[:letter])
    if @letter.save
      redirect_to [:backoffice, @letter], :notice => "Successfully created mail."
    else
      render :action => 'new'
    end
  end

  def edit
    @letter = Letter.find(params[:id])
  end

  def update
    @letter = Letter.find(params[:id])
    if @letter.update_attributes(params[:letter])
      redirect_to [:backoffice, @letter], :notice  => "Successfully updated mail."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy
    redirect_to backoffice_letters_url, :notice => "Successfully destroyed mail."
  end

  def send_email
    @letter = Letter.find(params[:id])
    UserMailer.send_mail(@letter).deliver
    redirect_to [:backoffice, @letter], :notice => "email sent"
  end
end
