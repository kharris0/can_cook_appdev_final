Rails.application.routes.draw do

  # NAV Bar Links
  get("/", { :controller => "application", :action => "homepage" })

  # Routes for the Ingredient in recipe resource:

  # CREATE
  post("/insert_ingredient_in_recipe", { :controller => "ingredient_in_recipes", :action => "create" })
          
  # READ
  get("/ingredient_in_recipes", { :controller => "ingredient_in_recipes", :action => "index" })
  
  get("/ingredient_in_recipes/:path_id", { :controller => "ingredient_in_recipes", :action => "show" })
  
  # UPDATE
  
  post("/modify_ingredient_in_recipe/:path_id", { :controller => "ingredient_in_recipes", :action => "update" })
  
  # DELETE
  get("/delete_ingredient_in_recipe/:path_id", { :controller => "ingredient_in_recipes", :action => "destroy" })

  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  post("/insert_favorite", { :controller => "favorites", :action => "create" })
          
  # READ
  get("/fridge", { :controller => "favorites", :action => "index" })
  
  get("/fridge/:path_id", { :controller => "favorites", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite/:path_id", { :controller => "favorites", :action => "update" })
  
  # DELETE
  get("/delete_favorite/:path_id", { :controller => "favorites", :action => "destroy" })

  #------------------------------

  # Routes for the Cookbook resource:

  # CREATE
  post("/insert_cookbook", { :controller => "cookbooks", :action => "create" })
          
  # READ
  get("/cookbooks", { :controller => "cookbooks", :action => "index" })
  
  get("/cookbooks/:path_id", { :controller => "cookbooks", :action => "show" })
  
  # UPDATE
  
  post("/modify_cookbook/:path_id", { :controller => "cookbooks", :action => "update" })
  
  # DELETE
  get("/delete_cookbook/:path_id", { :controller => "cookbooks", :action => "destroy" })

  #------------------------------

  # Routes for the Ingredient resource:

  # CREATE
  post("/insert_ingredient", { :controller => "ingredients", :action => "create" })
          
  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  
  get("/ingredients/:path_id", { :controller => "ingredients", :action => "show" })
  
  # UPDATE
  
  post("/modify_ingredient/:path_id", { :controller => "ingredients", :action => "update" })
  
  # DELETE
  get("/delete_ingredient/:path_id", { :controller => "ingredients", :action => "destroy" })

  #------------------------------

  # Routes for the Recipe resource:

  # CREATE
  post("/insert_recipe", { :controller => "recipes", :action => "create" })
          
  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  
  get("/recipes/:path_id", { :controller => "recipes", :action => "show" })
  
  # UPDATE
  
  post("/modify_recipe/:path_id", { :controller => "recipes", :action => "update" })
  
  # DELETE
  get("/delete_recipe/:path_id", { :controller => "recipes", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  #SHOW ALL USERS
  get("/users", { :controller => "users", :action => "index" })

  #SHOW USER PROFILE
  get("/users/:path_id", { :controller => "users", :action => "show" }) 


  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
