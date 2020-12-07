class RecipesController < ApplicationController
   skip_before_action(:force_user_sign_in, { :only => [:index] })
  def index
    matching_recipes = Recipe.all

    @list_of_recipes = matching_recipes.order({ :created_at => :desc })

    render({ :template => "recipes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recipes = Recipe.where({ :id => the_id })

    @the_recipe = matching_recipes.at(0)

    render({ :template => "recipes/show.html.erb" })
  end

  def create
    the_recipe = Recipe.new
    the_recipe.name = params.fetch("query_name")
    the_recipe.instructions = params.fetch("query_instructions")
    the_recipe.total_time = params.fetch("query_total_time")
    the_recipe.cooking_time = params.fetch("query_cooking_time")
    the_recipe.image = params.fetch("query_image")
    the_recipe.author_user_id = params.fetch("query_author_user_id")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes", { :notice => "Recipe created successfully." })
    else
      redirect_to("/recipes", { :notice => "Recipe failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.name = params.fetch("query_name")
    the_recipe.instructions = params.fetch("query_instructions")
    the_recipe.total_time = params.fetch("query_total_time")
    the_recipe.cooking_time = params.fetch("query_cooking_time")
    the_recipe.image = params.fetch("query_image")
    the_recipe.author_user_id = params.fetch("query_author_user_id")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes/#{the_recipe.id}", { :notice => "Recipe updated successfully."} )
    else
      redirect_to("/recipes/#{the_recipe.id}", { :alert => "Recipe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.destroy

    redirect_to("/recipes", { :notice => "Recipe deleted successfully."} )
  end
end
