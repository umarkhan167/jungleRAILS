require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for User Model' do
    describe 'password validation' do
      it 'should pass validation if it was made with both password and password confirmation field' do
        @user = User.new({:first_name => 'Bob', :last_name => 'Henry', :email => 'Bob@test.com', :password => '123abc', :password_confirmation => '123abc'})
        expect(@user).to be_valid
      end
      it 'should not be valid if it is missing either password or password confirmation field' do
        @user = User.new({:first_name => 'Bob', :last_name => 'Henry', :email => 'Bob@test.com', :password => '123abc', :password_confirmation => nil})
        expect(@user).to_not be_valid
      end
      it 'should validate if both password and password_confrimation match' do
        @user = User.new({:first_name => 'Bob', :last_name => 'Henry', :email => 'Bob@test.com', :password => '123abc', :password_confirmation => '123abc'})
        expect(@user.password).to eq(@user.password_confirmation)
      end
      it 'should not validate if password is under 4 characters' do
        @user = User.new({:first_name => 'Bob', :last_name => 'Henry', :email => 'Bob@test.com', :password => '123', :password_confirmation => '123'})
        expect(@user).to_not be_valid
      end
    end

    describe 'email validation' do
      it 'should not be valid if there is not an email listed' do
        @user = User.new({:first_name => 'Bob', :last_name => 'Henry', :email => nil, :password => '123abc', :password_confirmation => '123abc'})
        expect(@user).to_not be_valid
      end
      it 'should validate if it is a special case insesitive user name' do
        User.create({:first_name => 'Bob', :last_name => 'Henry', :email => 'gizmo@test.com', :password => '123abc', :password_confirmation => '123abc'})
        @find_user_email =  User.find_by_email('Andy@test.com')
        @user = User.new({:first_name => 'Andy', :last_name => 'Brown', :email => 'Andy@test.com', :password => '123abc', :password_confirmation => '123abc'})
        expect(@find_user_email).to eq(nil)
      end
    end
  end
end