class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.string :ingredient_type
      t.string :ABV
      t.string :image_url

      t.timestamps
    end
  end
end
