# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  commenter  :string
#  body       :text
#  article_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "valid comment" do
    comment = Comment.new
    comment.id = 1
    comment.body = "my test comment"
    comment.article_id = articles(:article2).id
    comment.user_id = users(:user2).id

    assert comment.valid?
  end

  test "should hava a body" do
    comment = Comment.new
    comment.id = 1
    comment.article_id = articles(:article2).id
    comment.user_id = users(:user2).id

    assert_not comment.valid?
  end

  test "should belongs to an article" do
    comment = Comment.new
    comment.id = 1
    comment.body = "my test comment"
    comment.user_id = users(:user2).id

    assert_not comment.valid?
  end

  test "should belongs to a user" do
    comment = Comment.new
    comment.id = 1
    comment.body = "my test comment"
    comment.article_id = articles(:article2).id

    assert_not comment.valid?
  end

end
