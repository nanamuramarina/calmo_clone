class Admin::SearchesController < ApplicationController
  def search
    @search_word = params[:search_word]
    @results = Customer.where("first_name LIKE ? OR last_name LIKE ?", "%#{@search_word}%", "%#{@search_word}%")
  end
end