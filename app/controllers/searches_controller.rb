class SearchesController < ApplicationController
  def search
    @search_word = params[:search_word]
    @results = Hotel.where("name LIKE ?", "%#{@search_word}%")
  end
end
