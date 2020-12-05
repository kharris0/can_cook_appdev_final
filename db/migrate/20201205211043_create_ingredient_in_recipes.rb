class CreateIngredientInRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_in_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
