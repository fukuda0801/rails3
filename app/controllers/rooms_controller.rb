class RoomsController < ApplicationController
  def index
    @rooms = Room.all

  end

  def new
    @room = Room.new
  end 

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :value, :address, :hotel,:user_id))
    if @room.save
      flash[:notice] = "施設を新規登録しました"
      redirect_to rooms_path
    else
      render "new"
    end 
  end 
  
  def show 
    @room = Room.find(params[:id])
    @q = Room.ransack(params[:q])
    
  end 

  def edit 
    @room = Room.find(params[:id])
  end 

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :value, :address, :hotel, :user_id))
      flash[:notice] = "施設情報を編集しました"
      redirect_to rooms_path
    else
      render "edit"
    end 
  end 

  def destroy 
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設情報を削除しました"
    redirect_to rooms_path
  end 

  def search
    @q = Room.ransack(params[:q])
    @results = @q.result
  end 
end
