# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  email                :string           default(""), not null
#  encrypted_password   :string           default(""), not null
#  remember_created_at  :datetime
#  confirmation_token   :string
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  username             :string
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'valid user' do
    user = users(:user1)
    assert user.valid?
  end

  # test 'valid user with blank username' do
  #   user = User.new(email: "user@example.com",
  #                   encrypted_password: "123456", 
  #                   password_confirmation: "123456",
  #                   username: '    ')
  #     byebug
  #   assert user.valid?
  # end

  test 'invalid username length' do
    user = users(:user1)
    user.username = 'qw'
    byebug
    assert_not user.valid?, "Username must have 3 characters"
  end

  test 'invalid username format with only numbers' do
    user = users(:user1)
    user.username = '1234'

    assert_not user.valid?, "Username must only contain characters"
  end

  test 'invalid username format with characters and numbers' do
    user = users(:user1)
    user.username = 'abc1234'

    assert_not user.valid?, "Username must only contain characters"
  end

  # test 'invalid username: uniqueness' do
  #   user1 = User.new(email: "user1@example.com", 
  #                   password: "123456", 
  #                   password_confirmation: "123456",
  #                   username: "user1")

  #   user2 = User.new(email: "user2@example.com", 
  #                   password: "123456", 
  #                   password_confirmation: "123456",
  #                   username: "user2")
    
  #   byebug
  #   assert_not user2.valid?
  # end
end
