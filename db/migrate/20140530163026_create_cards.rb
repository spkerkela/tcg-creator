class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name

      t.timestamps
    end
    add_index :cards, :name
  end
end
