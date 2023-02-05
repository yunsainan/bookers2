class UsersController < ApplicationController
  #ログインユーザー本人のみ編集・更新可能
  #ログインユーザー本人のみindex show閲覧可能
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :user_info_new_book, only: [:index, :show]



  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def index
    user_info_new_book
    @users = User.all
  end

  def show
    user_info_new_book
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have update user successfuly."
    redirect_to user_path(@user.id)
   else
    render :edit
   end
  end


  private


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
   user_id = params[:id].to_i
   login_user_id = current_user.id
   if user_id != login_user_id
     redirect_to user_path(current_user.id)
   end
  end


end
