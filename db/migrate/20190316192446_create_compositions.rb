class CreateCompositions < ActiveRecord::Migration[5.1]
  def change
    create_table :compositions do |t|
      t.float :quantity
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :user_id

      t.timestamps
    end
  end
end
