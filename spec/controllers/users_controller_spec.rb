require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'unauthenticated user' do
    it 'redirect to login page' do
      get :index
      expect(response).to redirect_to('/users/sign_in')
    end
  end

  describe 'admin user' do
    it 'admin can see other users' do
      puts 'can mnage admin'
      user = User.new(login: 'test', email: 'test@test.com', password: 'test1234', role: User.roles["admin"])
      user.save
      sign_in user
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)            
    end
  end

  describe 'guest user' do
    it 'cannot see other users' do
      puts 'can mnage guest'
      user = User.new(login: 'test', email: 'test@test.com', password: 'test1234', role: User.roles["guest"])
      user.save
      sign_in user
      get :index
      expect(response).to redirect_to('/home/index')
    end
  end
end
