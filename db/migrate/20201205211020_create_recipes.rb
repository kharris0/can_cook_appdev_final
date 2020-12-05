class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :instructions
      t.time :total_time
      t.string :cooking_time
      t.string :image
      t.integer :author_user_id

      t.timestamps
    end
  end
end
