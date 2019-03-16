class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :instructions
      t.integer :calories_per_serving
      t.integer :user_id

      t.timestamps
    end
  end
end
