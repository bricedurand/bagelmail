class LettersController < ApplicationController
  def index
    @letters = Letter.all
    # @letters = current_user.letters
  end

  def show
    @letter = Letter.find params[:id]
    # @letters = current_user.letters.find params[:id]
  end
end
