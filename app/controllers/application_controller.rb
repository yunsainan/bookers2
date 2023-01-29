class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   @user = current_user
   user_path(@user.id)
  end
  
  
  protected
  #config   認証キーemail=>nameにした
  #sign_up時   設定ユーザー名email=>name 
  #ストロングパラメーター   認証キーでないname=>認証キーにしたいemail
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  def user_info_new_book
   @user = current_user
   @new_book = Book.new
  end
  
end
