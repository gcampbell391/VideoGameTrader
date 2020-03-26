require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without a name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.new(password_digest: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a address" do
    user = User.new(address: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a address" do
    user = User.new(user_name: nil)
    expect(user).to_not be_valid
  end
end 
