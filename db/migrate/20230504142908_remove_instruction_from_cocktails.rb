class RemoveInstructionFromCocktails < ActiveRecord::Migration[7.0]
  def change
    remove_column :cocktails, :instruction, :text
  end
end
