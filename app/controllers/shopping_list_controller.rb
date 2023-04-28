class ShoppingListController < ApplicationController
  def index; end

  def new
    @new_list = RecipeFood.new
  end
end
