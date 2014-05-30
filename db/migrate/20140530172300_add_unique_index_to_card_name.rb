class AddUniqueIndexToCardName < ActiveRecord::Migration
  def change
        remove_index :cards, :name
        add_index :cards, :name, unique: true
  end
end
