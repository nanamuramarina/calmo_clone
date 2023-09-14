class Hotel::ReportsController < ApplicationController
  def new
    @report = Report.new
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @report = Report.new(report_params)
    @report.hotel_id = current_hotel.id
    @report.customer_id = @customer.id
    if @report.save
      redirect_to hotel_mypage_path(@hotel), notice: "ご報告ありがとうございます"
    else
      render "new"
    end
  end


  private

  def report_params
    params.require(:report).permint(:reason)
  end
end
