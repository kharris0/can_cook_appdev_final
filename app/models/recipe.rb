# == Schema Information
#
# Table name: recipes
#
#  id             :integer          not null, primary key
#  cooking_time   :string
#  image          :string
#  instructions   :string
#  name           :string
#  total_time     :time
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_user_id :integer
#
class Recipe < ApplicationRecord
end
