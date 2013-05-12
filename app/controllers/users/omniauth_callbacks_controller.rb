class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def dropbox
    @user = User.find_for_dropbox_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Dropbox") if is_navigational_format?
    else
      session["devise.dropbox_data"] = request.env["omniauth.auth"]
      redirect_to edit_registration_path(current_user)
    end
  end
end
