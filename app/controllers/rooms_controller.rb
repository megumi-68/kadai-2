class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = current_user.rooms
  end

  def show
    # rooms#showにて使用
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to rooms_path, notice: '施設が作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: '施設が更新されました。'
    else
      flash.now[:alert] = '更新に失敗しました。入力内容をご確認ください。'
      render :edit
    end
  end

  def destroy
    if @room.destroy
      redirect_to rooms_path, notice: '施設を削除しました'
    else
      redirect_to @room, alert: '施設の削除に失敗しました'
    end
  end

  def search
    query = params[:query]
    @rooms = Room.where("name LIKE ? OR detail LIKE ?", "%#{query}%", "%#{query}%")
  end
  
  def area_search
    area = params[:area]
    @rooms = Room.where("address LIKE ?", "%#{area}%")
  end

  private

  def room_params
    params.require(:room).permit(:name, :detail, :price, :address, :icon)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
