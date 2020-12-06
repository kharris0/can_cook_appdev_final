# == Schema Information
#
# Table name: favorites
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :integer
#  user_id       :integer
#
class Favorite < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:ingredient, { :required => false, :class_name => "Ingredient", :foreign_key => "ingredient_id" })
  
end
