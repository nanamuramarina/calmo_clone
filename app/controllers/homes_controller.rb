class HomesController < ApplicationController

  def index
    @menus = Menu.all
    @new_menus = @menus.last(3)
  end
end
