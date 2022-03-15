require 'rails_helper'


# t.string   "name"
# t.string   "email"
# t.string   "password_digest"
# t.datetime "created_at",      null: false
# t.datetime "updated_at",      null: false

RSpec.describe User, type: :model do
  describe "Validations" do
    it "a password should match validation" do
      @user = User.new(:name => "name", :email => "email", :password => "password", :password_confirmation => "password")
      expect(@user.valid?).to equal(true)
    end

    it "a password should exist" do
      @user = User.new(:name => "name", :email => "email", :password => "password", :password_confirmation => "password")
      expect(@user.password).to be_truthy
    end

    it "a validation should exist" do
      @user = User.new(:name => "name", :email => "email", :password => "password", :password_confirmation => "password")
      expect(@user.password_confirmation).to be_truthy
    end

    it "The password should at least 6 characters long" do
      @user = User.new(:name => "name", :email => "email", :password => "password", :password_confirmation => "password")
      expect(@user.password.length).to be >= 6
    end

    describe '.authenticate_with_credentials' do
      it "the user should return a user with valid login" do
        @user = User.create(:name => "name", :email => "email", :password => "password", :password_confirmation => "password")
  
        auth = User.authenticate_with_credentials("email", "password")

        expect(auth).to be_truthy
      end

      it "the user should return a user nil with invalid login" do
        @user = User.create(:name => "name", :email => "email", :password => "password", :password_confirmation => "password")
  
        auth = User.authenticate_with_credentials("bad", "wrong")

        expect(auth).to be_falsey
      end
    end

  end
end
