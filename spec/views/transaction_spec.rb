require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Billy', email: 'gilbalo@gmail.com', password: '123456')
    @user1.save
    @category = Category.new(name: 'Cat IV', icon: '🍎')
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    click_link 'New Category'
    fill_in 'Name', with: @category.name
    click_button 'Save'
  end

  it 'should be able to see transactions' do
    click_on 'Cat IV'
    expect(page).to have_content('TRANSACTIONS')
  end
end
