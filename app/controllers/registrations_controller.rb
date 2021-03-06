class RegistrationsController < Devise::RegistrationsController


  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end

  def after_sign_up_path_for(resource)
    "/products"
  end

  def after_inactive_sign_up_path_for(resource)
    "/products"
  end

  private
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end