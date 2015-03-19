require 'rails_helper'


feature 'the login process' do
  before :each do
    User.create(email: 'test@test.com', password: 'password')
  end

  scenario 'logs in user with correct credentials' do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'You\'ve been logged in.'
  end

  scenario 'returns error for bad credentials' do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'wrong'
    click_button 'Log in'
    expect(page).to have_content 'There was a problem logging you in.'
  end
end
