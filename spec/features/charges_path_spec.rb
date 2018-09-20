require 'rails_helper'

describe 'the charge a card process' do
  it 'will log in and make a purchase' do
    visit products_path
    click_on 'Log In'
  end
end
