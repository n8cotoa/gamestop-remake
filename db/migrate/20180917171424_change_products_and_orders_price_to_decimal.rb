# frozen_string_literal: true

class ChangeProductsAndOrdersPriceToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :decimal
    change_column :orders, :total_price, :decimal
  end
end
