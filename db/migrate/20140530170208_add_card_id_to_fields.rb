class AddCardIdToFields < ActiveRecord::Migration
  def change
    add_column :fields, :card_id, :integer
  end
end
