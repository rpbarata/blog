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
  test "valid draft article" do
    article = articles(:article1)
    assert article.valid?
  end


  test "should not save article without title" do
    article = Article.new
    article.id = 1
    article.is_published = false
    article.user = users(:user1)

    assert_not article.valid?
  end

  test "should not save an article with a title.length < 5" do
    article = Article.new
    article.id = 1
    article.title = "qwer"
    article.is_published = false
    article.user = users(:user1)

    assert_not article.valid?
  end

  test "valid published article" do
    article = articles(:article2)
    assert article.valid?
  end

  test "should not publish an article without an username" do
    article = Article.new
    article.id = 1
    article.title = "qwerty"
    article.text = "qwertyuiop"
    article.is_published = true
    article.user = users(:user1)

    assert_not article.valid?
  end

  test "should not publish an article without text" do
    article = Article.new
    article.id = 1
    article.title = "qwerty"
    article.is_published = true
    article.user = users(:user2)

    assert_not article.valid?
  end


  test "should not publish an article without title" do
    article = Article.new
    article.id = 1
    article.text = "qwertyuiop"
    article.is_published = true
    article.user = users(:user2)

    assert_not article.valid?
  end

  test "should not publish an article without title and text" do
    article = Article.new
    article.id = 1
    article.is_published = true
    article.user = users(:user2)

    assert_not article.valid?
  end
  
end
