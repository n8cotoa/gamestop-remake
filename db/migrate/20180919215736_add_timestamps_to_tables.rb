class AddTimestampsToTables < ActiveRecord::Migration[5.2]
  def change
    change_table :order_items do |t|
      t.timestamps
    end
    change_table :orders do |t|
      t.timestamps
    end
    change_table :products do |t|
      t.timestamps
    end
  end
end
