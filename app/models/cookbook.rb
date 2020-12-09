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


def can_cook?
  recipe = self.recipe
  ingredient = IngredientInRecipe.where( :recipe_id => recipe.id )
  recipe_ingredient_ids = ingredient.pluck(:ingredient_id)


  fridge = Favorite.where( :user_id => self.user_id)
  # return fridge.inspect

  fridge_ingredient_ids = fridge.pluck(:ingredient_id)

  fridge_count = 0
  recipe_ingredient_ids.each do |an_id|
    if fridge_ingredient_ids.include?(an_id)
      fridge_count = fridge_count + 1
    end

  end

  p recipe_ingredient_ids
  p fridge_ingredient_ids

  return "You have #{fridge_count} of the #{ingredient.count} needed ingredients."


end





end
