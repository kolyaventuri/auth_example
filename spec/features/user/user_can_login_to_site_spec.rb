require 'rails_helper'

describe 'User' do
  before(:each) do
    DatabaseCleaner.clean
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe 'visits /login' do
    it 'should allow the user to log into their account' do
      user = User.create!(name: 'Bob Ross', password: 'happy_little_trees', email: 'bob@bobross.com')

      visit '/login'

      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password

      click_on 'Login'

      expect(page).to equal('/login/success')
      expect(page).to have_content('Welcome!')
    end

    it 'should block incorrect passwords' do
      user = User.create!(name: 'Bob Ross', password: 'happy_little_trees', email: 'bob@bobross.com')

      visit '/login'

      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: 'fluffy_clouds'

      click_on 'Login'

      expect(page).to equal('/login')
      expect(page).to have_content('Incorrect email or password')
    end
  end
end