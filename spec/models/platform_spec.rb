require 'rails_helper'

RSpec.describe Platform, type: :model do

  it "is not valid without a name" do
    platform = Platform.new(name: nil)
    expect(platform).to_not be_valid
  end
end
