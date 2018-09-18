# frozen_string_literal: true

class AddOrdersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :user_id
      t.integer :total_price
    end
  end
end
