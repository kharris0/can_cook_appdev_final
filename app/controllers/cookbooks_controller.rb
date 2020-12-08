class CookbooksController < ApplicationController
  def index
    matching_cookbooks = Cookbook.all

    @list_of_cookbooks = matching_cookbooks.order({ :created_at => :desc })

    render({ :template => "cookbooks/index.html.erb" })
  end

  def show
    
    the_id = params.fetch("path_id")

    @matching_cookbooks = Cookbook.where({ :user_id => the_id })

    @the_cookbook = @matching_cookbooks.at(0)

    if @the_cookbook == nil
      render({ :template => "cookbooks/error.html.erb" })
    else 
      render({ :template => "cookbooks/show.html.erb" })
    end

  end

  def create
    the_cookbook = Cookbook.new
    the_cookbook.user_id = params.fetch("query_user_id")
    the_cookbook.recipe_id = params.fetch("query_recipe_id")

    if the_cookbook.valid?
      the_cookbook.save
      redirect_to("/users/" + the_cookbook.user_id.to_s, { :notice => "Recipe was successfully added to your cookbook." })
    else
      redirect_to("/users/"+ the_cookbook.user_id.to_s, { :notice => "Recipe was not successfully added to your cookbook." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_cookbook = Cookbook.where({ :id => the_id }).at(0)

    @the_cookbook.user_id = params.fetch("query_user_id")
    @the_cookbook.recipe_id = params.fetch("query_recipe_id")

    if @the_cookbook.valid?
      @the_cookbook.save
      redirect_to("/users/" + @the_cookbook.user_id.to_s, { :notice => "Recipe updated successfully."} )
    else
      redirect_to("/users/" + @the_cookbook.user_id.to_s, { :alert => "Recipe in cookbook failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_cookbook = Cookbook.where({ :id => the_id }).at(0)

    @the_cookbook.destroy

    redirect_to("/users/" + @the_cookbook.user_id.to_s, { :notice => "Recipe successfully removed from your cookbook."} )
  end
end
