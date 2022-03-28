# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  username        :string           not null
#  birth_date      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:birth_date) }
  end
  describe "#associations" do
  end
  describe "#scope methods" do
    describe ".password=(password)" do
      let(:user) { 
        FactoryBot.build(:user)
       }

       it "should hash the password and store it to password_digest" do
        user = FactoryBot.build(:user,password: 'testingmyluck')
        user.valid?
        expect(user.password_digest).to_not be_empty 
       end

       it "should return false if the password length < 6" do
        user = FactoryBot.build(:user,password: 'lengt')
        user.valid?
        expect(user.errors.messages[:password]).to eq ['The password must be at least 6 characters'] 
       end

    end
    describe ".is_password!" do
      let(:user) { FactoryBot.build(:user) }
      it "check if the password entered is valid" do
        user = FactoryBot.build(:user,password: 'testingmyluck')
        expect(user.is_password!('testingmyluck')).to be true
      end
      it "should return false if the password is invalid" do
        user = FactoryBot.build(:user,password: 'testingmyluck')
        expect(user.is_password!('luckisfuckdup')).to be false
      end
    end
    describe "!generate_session_token" do 
      it "generate just a random token" do
        expect(User.generate_session_token!).to be_present
      end
      it "expect that the generated session token is the same" do
        expect(User.generate_session_token!).to_not eq User.generate_session_token!
      end
    end
    describe ".reset_session_token!" do
      it "expect that the existing session token is set to the new session token" do
        user = FactoryBot.build(:user)
        old_session = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq old_session
      end
      it "expect to return the new session token" do
        user = FactoryBot.build(:user)
        expect(user.reset_session_token!).to eq user.session_token
      end
    end
    describe ".find_by_credentials" do 
      it "finds the correct record in the database and return the founded record " do
        user = FactoryBot.create(:user)
        # find the record in the database
        expect(User.find_by_credentials!(user.email,user.password)).to be_truthy
        # return the founded record
        expect(User.find_by_credentials!(user.email,user.password)).to eq(user)
      end
      it "dosen't find the record and return nil" do
        expect(User.find_by_credentials!("test@test","testsss")).to be nil
      end
    end
  end
end
