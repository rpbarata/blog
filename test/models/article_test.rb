# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  title        :string
#  text         :text
#  is_published :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
