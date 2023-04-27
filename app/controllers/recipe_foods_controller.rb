class RecipeFoodsController < ApplicationController

  def new 
    @new_recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = Recipe.new(rf_params)
    if @recipe_food.save!
      flash[:sucess] = "food successfully created"
    else
      flash[:error] = "failed to add food to recipe"
    end
    redirect_to user_recipe_path(u_id, r_id)
  end

  def rf_params
    params.require(:recipe_food).permit(:food_id, :quantity).merge(recipe_id:params[:recipe_id])
  end

  # create method for id

  def u_id
    @user = User.find(params[:id])  
  end
  def r_id
    @recipe = Recipe.find(params[:id])
  end
end
