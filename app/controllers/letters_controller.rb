class LettersController < ApplicationController
  def index
    @letters = current_user.letters.paginate(:page => params[:page])
  end

  def show
    @letters = current_user.letters.find params[:id]
  end
end
