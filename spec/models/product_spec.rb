require 'rails_helper'

describe Product do
  it { should have_many :order_items }
  it { should have_many(:orders).through(:order_items)}
end
