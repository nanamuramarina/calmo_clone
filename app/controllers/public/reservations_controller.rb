class Public::ReservationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @reservations = Reservation.where(customer_id: current_customer.id)
  end

  def show
    @reservation = Reservation.find(params[:id])

  end

  def new
    @menu = Menu.find(params[:menu_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @menu = @reservation.menu
    if @reservation.save!
      redirect_to reservations_completion_path
    else
      render :confirm
    end
  end

  def confirm
    if !params[:reservation].present?
      redirect_to menus_path
      return
    end
    @reservation = Reservation.new(reservation_params)
    @menu = @reservation.menu
    if @reservation.number.blank?
      flash[:alert] = "人数が入力されていません"
      render :new

    else
      @reservation.billing_fee = @reservation.number * @menu.price
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :menu_id, :number, :payment_method, :billing_fee,
      :start_reservation_date, :start_reservation_time,
      :end_reservation_date, :end_reservation_time
    )
  end
end