# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Ingredient < ApplicationRecord

  has_many(:favorites, { :class_name => "Favorite", :foreign_key => "ingredient_id", :dependent => :destroy })
  has_many(:ingredients_recipes, { :class_name => "IngredientInRecipe", :foreign_key => "ingredient_id", :dependent => :destroy })

  has_many(:users, { :through => :favorites, :source => :user })
  has_many(:recipes, { :through => :ingredients_recipes, :source => :recipe })
  
end
