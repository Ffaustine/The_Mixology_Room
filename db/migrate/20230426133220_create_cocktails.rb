class CreateCocktails < ActiveRecord::Migration[7.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :category
      t.string :IBA
      t.string :glass
      t.string :image_url
      t.text :instruction

      t.timestamps
    end
  end
end
