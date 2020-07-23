# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  title        :string
#  text         :text
#  is_published :boolean
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end

  test "should not save article with a title with less then 5 characters" do
    article = Article.new(title: 'qwer')
    assert_not article.save, "saved the article with a title with less then 5 characters"
end

  test "should not publish an article if does not have a title and a text" do
    article = Article.new(is_published: true)
    assert_not article.save, "saved a published article without a title"
  end

  # test "should not publish an article if does not have a title" do
  #   article = Article.new
  #   article.is_published = true;
  #   article.text = "my text"
  #   assert_not article.save, "saved a published article without a title"
  # end

  # test "should not publish an article if does not have a text" do
  #   article = Article.new
  #   article.is_published = true;
  #   article.title = "my title"
  #   assert_not article.save, "saved a published article without a title"
  # end

  # test "should not publish an artice if user does not have hava a username" do
  #   user = User.new
  #   user.email = "user0@user0"

  #   article = Article.new
  #   article.is_published = true;
  #   article.title = "my title"
  #   article.text = "my text"
  #   article.user = user
  #   assert_not article.save, "saved an article as published, even without a username"
  # end
end
