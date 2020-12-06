# == Schema Information
#
# Table name: ingredient_in_recipes
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :integer
#  recipe_id     :integer
#
class IngredientInRecipe < ApplicationRecord


  belongs_to(:recipe, { :required => false, :class_name => "Recipe", :foreign_key => "recipe_id" })
  belongs_to(:ingredient, { :required => false, :class_name => "Ingredient", :foreign_key => "ingredient_id" })
  
end
