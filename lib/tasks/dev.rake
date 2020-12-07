desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  User.destroy_all
  Recipe.destroy_all
  Ingredient.destroy_all

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

  ingredient_list = ["00 flour", "acorn squash", "ahi tuna", "ajwain seeds", "albacore tuna", "aleppo pepper", "alfalfa", "all purpose flour", "almonds", "almond butter", "almond extract", "almond flour", "almond milk", "amchur powder", "ancho chile", "ancho chile (whole)", "anchovies", "apple cider vinegar", "Apple juice", "apples", "applesauce", "aquavit", "arbol chile", "arborio rice", "artichoke", "artichoke hearts", "artichokes", "arugala", "asafetida powder", "asparagus", "avocado", "bacon", "bagels", "baked beans", "baking powder", "baking soda", "balsamic vinegar", "bananas", "barley", "barley", "malt syrup", "basil", "basmati rice", "beef broth", "beef", "beer", "bison", "black beans", "black garlic", "black rice", "black-eyed peas", "blood orange", "blue cheese", "blueberries", "bluefish", "bread", "bread flour", "breadcrumbs", "broccoli", "brown rice", "brown rice flour", "brown sugar", "bucatini", "bulgar", "butter (salted)", "butter (unsalted)", "butter lettuce", "Cabbage", "cacao powder", "cake flour", "canned chicken", "canned corn", "canned salmon", "canned tuna", "canning salt", "canola oil", "capers", "cardamom (ground)", "cardamom (whole)", "carrots", "cashew butter", "cashew milk", "cashews", "Castelvetrano olives", "caster sugar", "catfish", "cauliflower", "cayenne pepper", "celery", "cereal", "chaat masala", "cheddar cheese", "cheese", "chicken", "chicken broth", "chickpeas", "chile peppers (whole)", "chiles de arbol", "chili powder", "chipotle morita chiles", "chives", "chocolate", "chowder", "cilantro", "cinnamon (ground)", "cinnamon sticks", "citrus vinegar", "clams", "cloves (ground)", "cloves (whole)", "coconut aminos", "coconut chips", "coconut flour", "coconut milk", "coconut milk (reduced fat)", "coconut oil", "cod", "coffee", "confectioner's sugar", "cornstarch", "coriander (ground)", "coriander (whole)", "corn", "corn syrup", "cornmeal", "crab", "crackers", "cranberries", "cranberry beans", "cream cheese", "cream of tartar", "cucumbers", "cumin (ground)", "cumin (whole)", "curry powder", "daikon", "dates", "demerara sugar", "dill", "dried apricots", "dried barberries", "dried basil", "dried blueberries", "dried chives", "dried cilantro", "duck", "edimame", "egg noodles", "eggplant", "eggs", "espresso", "everything spice", "farro", "fenugreek seeds", "figs", "fish sauce", "flakey sea salt", "french lentils", "fresh curry leaves", "furikake", "garam masala", "garlic (fresh)", "garlic poweder", "ghee", "ginger (fresh)", "ginger (ground)", "goat cheese", "graham crackers", "grapefruit", "grapes", "greek yogurt", "green beans", "green chiles", "green lentils", "green onion", "green peppers", "green speas", "grits", "ground beef", "ground pork", "habanero peppers", "half and half", "halibut", "ham", "hanger steak", "harissa", "harissa spice", "heavy whipping cream", "herbs de provence", "honey", "horseradish", "hot dogs", "hot sauce", "hummus", "impossible meat", "instant yeast", "italian parsley", "jalapeño", "jam", "japanese sweet potatoes", "jasmine rice", "jelly", "jerky (beef)", "jerky (salmon)", "jerky (turkey)", "kabocha squash", "kaffir lime leaves", "kalamata olives", "kale", "kalonji onion seeds", "ketchup", "kimchi", "korean pear", "kosher salt", "labneh", "lamb", "lasagna", "lentils", "lima beans", "linguine", "lobster", "macaroni", "maldon salt", "manchego cheese", "maple syrup", "marcona almonds", "matcha", "mayonnaise", "melon", "milk (1%)", "milk (2%)", "milk (whole)", "milk chocolate chips", "Mint", "mirin", "molasses", "mozzarella cheese", "mustard", "mustard seed (ground)", "mustard seeds (black)", "mustard seeds (brown)", "mustard seeds (yellow)", "noodles", "nori", "nutmeg (ground)", "nutmeg (whole)", "nutritional yeast", "oat milk", "oats (whole)", "octopus", "olive oil", "olives", "oregano", "oyster mushrooms", "panko breadcrumbs", "paprika", "parmesan", "parsley", "peanut butter", "peanut butter (creamy)", "peanut butter (crunchy)", "peanuts", "pear", "pearl", "onion", "pecans", "pepper", "peppercorns (balck)", "peppercorns (pink)", "peppercorns (szechuan)", "peppercorns (white)", "pepperoni", "pickled jalapeños", "pickles", "pickling salt", "pickling spice", "pine nuts", "pinto beans", "pistachios", "pomegranate", "pomegranate molasses", "pomegranate seeds", "potatoes", "powdered sugar", "prosciutto", "pumpkin puree", "quick oats", "rainbow sprinkles", "rasberries", "red onion", "red peppers", "red split lentils", "red wine", "red wine vinegar", "rice noodles", "rice vinegar", "romaine lettuce", "rose water", "rosehip", "rosemary", "rutabaga", "rye flour", "sabudana", "saffron", "sage", "salami", "salmon", "salt", "seaweed", "seitan", "semi-sweet chocolate chips", "semolina flour", "serrano peppers", "sesame oil", "sesame seeds (black)", "sesame seeds (white)", "shallot", "shawarma seasoning", "sherry vinegar", "shichimi togarashi", "shishito peppers", "shitake mushrooms", "shoju", "short grain brown rice", "shortening", "shredded coconut", "shrimp", "skirt steak", "small red beans", "small white beans", "smoked paprika", "soba noodles", "soy sauce", "soy sauce (low-sodium)", "spaghetti", "spam", "spanish onion", "spanish paprika", "spanish saffron", "spicy chili crisp", "spinach", "squid", "sriracha", "star anise", "steak", "strawberries", "sumac", "sushi rice", "sweet onion", "sweet potatoes", "tahini", "tamari", "tapioca flour", "tapioca starch", "tarragon", "tempeh", "tofu", "tomato (cherry)", "tomato (green)", "tomato (heirloom)", "tomato (roma)", "tomato paste", "tomato sauce", "tortilla chips", "tortillas", "unprocessed wheat bran", "urfa biber pepper", "vanilla bean", "vanilla extract", "vanilla paste", "vegetable broth", "vegetable oil", "vodka", "walnuts", "watermelon", "white onion", "white rice", "white sugar", "white wine", "white wine vinegar", "whole moong beans", "whole wheat flour", "wild rice", "xanthan gum", "yellow peppers", "yogurt", "za'atar", "zucchini"]

  
  384.times do |count|
    ingredient = Ingredient.new
    ingredient.name = ingredient_list.at(count)
    ingredient.save
  end
  p "Added #{Ingredient.count} Ingredients"


end
