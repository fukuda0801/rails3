class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def confirm
    @reservation = Reservation.new(params.permit(:checkin, :checkout, :number, :user_id, :room_id, :price))
    @room = Room.find(params[:room_id])
    @days = (@reservation.checkout - @reservation.checkin).to_i
    @price = @days * @room.value.to_i * @reservation.number.to_i
    if @reservation.checkin < Time.zone.today
      flash[:notice] = "チェックインは本日以降の日付としてください"
      render "rooms/show"
    elsif @reservation.checkin >= @reservation.checkout
      flash[:notice] = "チェックアウトはチェックイン以降の日付としてください"
      render "rooms/show"
    elsif @reservation.number < 1
      flash[:notice] = "人数は１人以上にしてください"
      render "rooms/show"
    end 
  end 

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :number, :user_id, :room_id, :price))
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      flash[:notice] = "予約完了しました"
      redirect_to reservations_path
    else
      flash[:notice] = "予約失敗しました"
      render "confirm"
    end 

      
  end 

  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end 

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を取り消しました"
    redirect_to reservations_path
  end 

end
