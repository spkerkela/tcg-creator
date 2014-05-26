require 'test_helper'

class UserTest < ActiveSupport::TestCase

    def setup
        @valid_user = users(:user_one)
        @valid_user.password = "password1"
        @valid_user.password_confirmation = "password1"
         
    end

    test "should save user with valid params" do

        assert @valid_user.valid?, "User should be valid"
        assert @valid_user.save, "User should have been saved"
    end

    test "should not save with no name" do
        user = @valid_user
        user.name = nil

        assert !user.valid?, "User should be ivanlid"
        assert !user.save, "User should not have been saved"
    end

    test "should not save with duplicate names" do
        user1 = @valid_user

        assert user1.valid?, "User one should be valid"
        assert user1.save, "User one should be saved normally"

        user2 = User.new
        user2.name = user1.name
        user2.password = "password1"
        user2.password_confirmation = "password1"

        assert !user2.valid?, "User two should not be valid"
        assert !user2.save
    end

    test "should not save with too long name" do
        user = @valid_user
        user.name = "a"*51

        assert !user.valid?, "User should not be valid"
        assert !user.save, "User should not be saved"
    end

    test "should save with 50 char name or smaller" do
        user = @valid_user
        user.name ="a"*50

        assert user.valid?, "User should be valid"
        assert user.save, "User should be saved normally"
    end

    test "should not save with too short name" do
        user = @valid_user
        user.name = "no"

        assert !user.valid?, "User should not be valid"
        assert !user.save, "User should not be saved"
    end

    test "should not save with too short password" do
        user = @valid_user
        user.password ="no"
        user.password_confirmation = user.password

        assert !user.valid?, "User should not be valid"
        assert !user.save, "User should not be saved"
    end

    test "should not save when passwords don't match" do
        user = @valid_user
        user.password_confirmation = "not the same as the other"

        assert !user.valid?, "User should not be valid"
        assert !user.save, "User should not be saved"
    end
end
