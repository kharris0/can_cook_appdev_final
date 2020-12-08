# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  authored_recipes_count :integer
#  bio                    :string
#  email                  :string
#  first_name             :string
#  last_name              :string
#  password_digest        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:favorites, { :class_name => "Favorite", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:cookbooks, { :class_name => "Cookbook", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:authored_recipes, { :class_name => "Recipe", :foreign_key => "author_user_id", :dependent => :nullify })

  has_many(:recipes, { :through => :cookbooks, :source => :recipe })
  has_many(:ingredients, { :through => :favorites, :source => :ingredient })
  has_many(:possible_recipes_to_cook, { :through => :ingredients, :source => :recipes })
  

  def full_name
    assembled_name = self.first_name.capitalize + " " + self.last_name.capitalize
    return assembled_name
  end

  # Not sure if the below method actually works. 
  def cookbooks
    my_id = self.id
    matching_cookbooks = Cookbook.where({ :user_id => my_id })
    return matching_cookbooks
  end


end
