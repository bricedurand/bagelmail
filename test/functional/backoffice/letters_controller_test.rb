require 'test_helper'

class Backoffice::LettersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Mail.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Mail.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Mail.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to backoffice_mail_url(assigns(:mail))
  end

  def test_edit
    get :edit, :id => Mail.first
    assert_template 'edit'
  end

  def test_update_invalid
    Mail.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Mail.first
    assert_template 'edit'
  end

  def test_update_valid
    Mail.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Mail.first
    assert_redirected_to backoffice_mail_url(assigns(:mail))
  end

  def test_destroy
    mail = Mail.first
    delete :destroy, :id => mail
    assert_redirected_to backoffice_mails_url
    assert !Mail.exists?(mail.id)
  end
end
