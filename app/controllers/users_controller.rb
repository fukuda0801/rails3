class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end 

  def update
    @user = User.find(current_user.id)
    if current_user.update(params.fetch(:user,{}).permit(:name, :introduction, :avatar))
      redirect_to user_path(current_user.id)
    else
      redirect_to homes_show_path
    end 
  end 
  
end
