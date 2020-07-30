# == Schema Information
#
# Table name: reply_comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  comment_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ReplyCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
