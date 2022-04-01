require 'rails_helper'

RSpec.describe Intention, type: :model do
  describe "#associations" do
    it { should belong_to(:user) }
  end
  describe "#public methods" do
  end
  describe "#validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:status) }
  end
end
