# frozen_string_literal: true

class AddPoductsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :name
    end
  end
end
