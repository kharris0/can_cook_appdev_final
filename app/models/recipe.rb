# == Schema Information
#
# Table name: recipes
#
#  id             :integer          not null, primary key
#  cooking_time   :string
#  image          :string
#  instructions   :string
#  name           :string
#  total_time     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_user_id :integer
#
class Recipe < ApplicationRecord


  belongs_to(:author, { :required => false, :class_name => "User", :foreign_key => "author_user_id", :counter_cache => :authored_recipes_count })
  has_many(:cookbooks, { :class_name => "Cookbook", :foreign_key => "recipe_id", :dependent => :destroy })
  has_many(:ingredients_recipes, { :class_name => "IngredientInRecipe", :foreign_key => "recipe_id", :dependent => :destroy })

  has_many(:user_fans, { :through => :cookbooks, :source => :user })
  has_many(:ingredients, { :through => :ingredients_recipes, :source => :ingredient })
  has_many(:potential_cooks, { :through => :ingredients, :source => :users })
  
  # def author
  #   my_author_id = self.author_user_id
  #   matching_users = User.where({ :id => my_author_id })
  #   the_author = matching_users.at(0)
  #   return the_author
  # end


end
