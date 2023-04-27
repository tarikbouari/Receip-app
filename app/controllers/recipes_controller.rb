class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
   @recipe = Recipe.find(params[:id]) 
   @recipe_foods = @recipe.recipe_foods.includes(:recipe, :food)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to user_recipe_path(@user, @recipe)
    else
      render :new, alert: 'Something went wrong!'
    end
  end

  def destroy
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    redirect_to user_recipes_path(@user)
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :preparation_time, :cooking_time, :description, :public)
  end
end
