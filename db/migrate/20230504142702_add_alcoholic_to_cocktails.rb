class AddAlcoholicToCocktails < ActiveRecord::Migration[7.0]
  def change
    add_column :cocktails, :alcoholic, :string
  end
end
