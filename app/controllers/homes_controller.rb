class HomesController < ApplicationController
  def top
    @q = Room.ransack(params[:q])
  end

  def show
    @user = current_user
  end
end
