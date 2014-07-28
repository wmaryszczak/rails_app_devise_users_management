require 'rails_helper'

RSpec.describe User, :type => :model do
  it "desn't require password before persited" do
    user = User.new(login: 'test', email: 'test@test.com')
    expect(user.password_required?).to eq(false)
  end

  it "requires password when setting up new password" do
    user = User.new(login: 'test', email: 'test@test.com')
    user.save
    user.reset_password_token = 'xyz'
    expect(user.password_required?).to eq(true)
  end
end
