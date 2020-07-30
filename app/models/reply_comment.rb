# == Schema Information
#
# Table name: reply_comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  comment_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
class ReplyComment < ApplicationRecord

  belongs_to :comment
  belongs_to :user

  has_rich_text :body
  validates :body, presence: true

end
