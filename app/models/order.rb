# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user, optional: true
  before_save :update_total
  before_save :update_status

  def calculate_total
    order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  def calculate_overall_quantity
    order_items.collect(&:quantity).sum
  end

  private

  def update_status
   if self.status == nil || self.status != 'Paid'
     self.status = 'In progress.'
   end
  end

  def update_total
    self.total_price = calculate_total
  end
end
