class RecipeFoodsController < ApplicationController
  def new
    @new_recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(rf_params)
    if @recipe_food.save!
      flash.now[:notice] = 'food successfully created'
    else
      flash.now[:alert] = 'failed to add food to recipe'
    end
    redirect_to user_recipe_path(u_id, r_id)
  end

  def rf_params
    params.require(:recipe_food).permit(:food_id, :quantity).merge(recipe_id: params[:recipe_id])
  end

  def destroy
    recipe_food = RecipeFood.find(params[:id])

    if recipe_food.destroy
      flash.now[:notice] = 'food successfully destroyed'
    else
      flash.now[:alert] = 'failed'
    end
    redirect_to user_recipe_path(u_id, r_id)
  end

  def update; end

  # create method for id

  def u_id
    @user = User.find(params[:user_id])
  end

  def r_id
    @recipe = Recipe.find(params[:recipe_id])
  end
end
