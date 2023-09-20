class Admin::SearchesController < ApplicationController
  def search
    @search_word = params[:search_word]
    @results = Customer.where("full_name LIKE ?", "%#{@search_word}%")
  end
end