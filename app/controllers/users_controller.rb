class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id)
   else
    render 'users/edit'
   end
  end


  private

  def user_params
    params.require(:user).pernit(:name, :profile_image)
  end
end
