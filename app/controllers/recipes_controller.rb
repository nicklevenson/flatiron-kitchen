class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end
  def show
    @recipe = Recipe.find_by(params[:id])
  end

  def edit
    @recipe = Recipe.find_by(params[:id])
    @ingredients = Ingredient.all
  end
  def update
    @recipe = Recipe.find_by(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  

  private

  def recipe_params 
    
    params.require(:recipe).permit(:name, ingredient_ids: [])
 
  end

end
