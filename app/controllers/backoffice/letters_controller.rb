class Backoffice::LettersController < ApplicationController
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
end
