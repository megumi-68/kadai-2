class ReservationsController < ApplicationController
  before_action :set_room, only: [:new, :create, :confirm]
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations.includes(:room).order(created_at: :desc)
  end

  def create
    @reservation = @room.reservations.build(reservation_params.merge(user: current_user))
    if @reservation.save
      redirect_to reservations_path, notice: '予約が確定しました。'
    else
      render :confirm
    end
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.room = @room
  end

  private
  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :person)
  end
end