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
    user = User.new(  email: "user@example.com", 
                      password: "123456", password_confirmation: "123456"
                    )
                    byebug
    assert user.valid?
  end

  test 'invalid username length' do
    user = User.new(email: "user@example.com", encrypted_password: "123456", username: 'qw')
    assert_not user.save
  end
end
