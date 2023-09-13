class Public::ReservationsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @reservations = Reservation.where(customer_id: current_customer.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @menu = @reservation.menu
    @hotel = @reservation.menu.hotel
    @customer = @reservation.customer
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @menu = @reservation.menu
    # render :new and return if params[:back] || !@reservation.save
    # # 最新の予約情報を取得
    # new_reservation_id = Reservation.order(created_at: :desc).limit(1).ids
    # redirect_to  public_reservation_path(new_reservation_id: new_reservation_id)
    if @reservation.save!
      redirect_to reservations_completion_path
    else
      render :confirm
    end
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @menu = @reservation.menu
  end

  private
  def reservation_params
    params.require(:reservation).permit(
      :menu_id, :number, :payment_method,:billing_fee,
      :start_reservation_year, :start_reservation_month, :start_reservation_day, :start_reservation_time,
      :end_reservation_year, :end_reservation_month, :end_reservation_day, :end_reservation_time)
  end

end
