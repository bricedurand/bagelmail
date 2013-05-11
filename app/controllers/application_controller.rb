class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  private
  def after_sign_in_path_for(arg)
    letters_path
  end

  def after_sign_out_path_for(arg)
    root_path
  end
end
