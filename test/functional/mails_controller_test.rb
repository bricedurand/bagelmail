require 'test_helper'

class MailsControllerTest < ActionController::TestCase
  setup do
    @mail = mails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail" do
    assert_difference('Mail.count') do
      post :create, mail: { attachement_count: @mail.attachement_count, sender: @mail.sender, state: @mail.state, user_id: @mail.user_id }
    end

    assert_redirected_to mail_path(assigns(:mail))
  end

  test "should show mail" do
    get :show, id: @mail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail
    assert_response :success
  end

  test "should update mail" do
    put :update, id: @mail, mail: { attachement_count: @mail.attachement_count, sender: @mail.sender, state: @mail.state, user_id: @mail.user_id }
    assert_redirected_to mail_path(assigns(:mail))
  end

  test "should destroy mail" do
    assert_difference('Mail.count', -1) do
      delete :destroy, id: @mail
    end

    assert_redirected_to mails_path
  end
end
