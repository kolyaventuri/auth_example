require 'rails_helper'

describe 'User' do
  before(:each) do
    DatabaseCleaner.clean
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe 'visits /register' do
    it 'should allow them to create an account' do
      visit '/register'

      name = 'Bob Ross'
      password = 'happy_little_trees'
      email = 'bob@bobross.com'

      expect(page).to have_content('Create an Account')

      fill_in 'user[name]', with: name
      fill_in 'user[password]', with: password
      fill_in 'user[email]', with: email

      click_on 'Create Account'

      expect(current_path).to eq('/register/success')
      expect(page).to have_content('You have registered!')
    end
  end
end
