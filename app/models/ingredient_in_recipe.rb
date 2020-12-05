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
end
