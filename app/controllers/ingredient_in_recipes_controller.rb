class IngredientInRecipesController < ApplicationController
  def index
    matching_ingredient_in_recipes = IngredientInRecipe.all

    @list_of_ingredient_in_recipes = matching_ingredient_in_recipes.order({ :created_at => :desc })

    render({ :template => "ingredient_in_recipes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ingredient_in_recipes = IngredientInRecipe.where({ :id => the_id })

    @the_ingredient_in_recipe = matching_ingredient_in_recipes.at(0)

    render({ :template => "ingredient_in_recipes/show.html.erb" })
  end

  def create
    the_ingredient_in_recipe = IngredientInRecipe.new
    the_ingredient_in_recipe.ingredient_id = params.fetch("query_ingredient_id")
    the_ingredient_in_recipe.recipe_id = params.fetch("query_recipe_id")
      if the_ingredient_in_recipe.valid?
        the_ingredient_in_recipe.save
        redirect_to("/recipes/" + the_ingredient_in_recipe.recipe_id.to_s, { :notice => "Ingredient was successfully added to recipe." })
      else
        redirect_to("/recipes/" + the_ingredient_in_recipe.recipe_id.to_s, { :notice => "Ingredient was not successfully added to recipe." })
      end
  end

  def update
    the_id = params.fetch("path_id")
    the_ingredient_in_recipe = IngredientInRecipe.where({ :id => the_id }).at(0)

    the_ingredient_in_recipe.ingredient_id = params.fetch("query_ingredient_id")
    the_ingredient_in_recipe.recipe_id = params.fetch("query_recipe_id")

    if the_ingredient_in_recipe.valid?
      the_ingredient_in_recipe.save
      redirect_to("/ingredient_in_recipes/#{the_ingredient_in_recipe.id}", { :notice => "Ingredient in recipe updated successfully."} )
    else
      redirect_to("/ingredient_in_recipes/#{the_ingredient_in_recipe.id}", { :alert => "Ingredient in recipe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_ingredient_in_recipe = IngredientInRecipe.where({ :id => the_id }).at(0)

    the_ingredient_in_recipe.destroy

    redirect_to("/ingredient_in_recipes", { :notice => "Ingredient in recipe deleted successfully."} )
  end
end
