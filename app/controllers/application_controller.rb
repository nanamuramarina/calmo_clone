class ApplicationController < ActionController::Base
  before_action :search

  def search
    @q = Hotel.ransack(params[:q])
    @hotel = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end

end
