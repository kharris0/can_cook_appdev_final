# == Schema Information
#
# Table name: cookbooks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer
#  user_id    :integer
#
class Cookbook < ApplicationRecord


  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:recipe, { :required => false, :class_name => "Recipe", :foreign_key => "recipe_id" })

  def recipe
    recipe_id = self.recipe_id

    matching_recipes = Recipe.where({ :id => recipe_id })

    the_recipe = matching_recipes.at(0)

    return the_recipe
  end
end
