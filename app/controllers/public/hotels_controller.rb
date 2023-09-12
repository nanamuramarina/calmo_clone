class Public::HotelsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  def search
    @results = @q.result
  end
  
  private

  def set_q
    @q = Hotel.ransack(params[:q])
  end

end
