desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

  first_names = ["Katie", "Beth", "Duncan", "Jenny", "Andy", "Giampaolo", "Chris", "Amanda", "Jim", "Kevin"]
  last_names = ["Harris", "Harris", "Harris," "Harris", "Harris", "Bianconi", "Harris", "Harris", "McDaniel", "Hochberg"]
  bool = [true, false]

  10.times do |count|
    user = User.new
    user.email = first_names.at(count)
    user.password = "abc"
    user.first_name = first_names.at(count)
    user.last_name = last_names.at(count)
    user.save
  end

  p "Added #{User.count} Users"


  recipe_name = ["Lemon Cake", "Mustard Vinaigrette", "Ginger Molasses Cookies", "Nebo's Granola", "Oysters Rocefeller", "Miso Baked Cod"]
  ingredients_count = ["8", "6", "9", "8", "5", "6"]
  instructions = ["Mix and bake", "Process in food processor. add oil", "Ginger, molasses, go go go!", "oats and spices, bake, then cranberries", "shuck 'em all, bread 'em, fry 'em up. Add lemon on top", "white miso, buttah, top it on fish and bake"]
  author_user_id = ["1", "4", "2", "1", "3", "5"]

  6.times do |count|
    recipe = Recipe.new
    recipe.name = recipe_name.at(count)
    recipe.instructions = instructions.at(count)
    recipe.author_user_id = author_user_id.at(count)
    recipe.save
  end
  p "Added #{Recipe.count} Recipes"

end
