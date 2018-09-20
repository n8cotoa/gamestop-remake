# frozen_string_literal: true

require 'rails_helper'

describe Product do
  it { should have_many :order_items }
  it { should have_many(:orders).through(:order_items) }
  it { should have_and_belong_to_many :users}
end
