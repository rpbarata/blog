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
#  banner       :string
#
class Article < ApplicationRecord

  belongs_to :user

  has_many :comments, dependent: :destroy

  # mount_uploader :banner, ImageUploader
  has_one_attached :banner

  has_rich_text :text

  validates   :title,
              presence: { message: "All articles must hava a title" },
              length: { minimum: 5 }

  validate   :validate_published_article
  validate   :validate_user_to_publish

  def validate_published_article
    if is_published
      unless title.present? && text.present?
        errors.add(:is_published, "An article to be published must hava a title and text.")
      end
    end
  end

  def validate_user_to_publish
    if is_published && user.username.nil?
      errors.add(:is_published, "You must have a username to post an article.")
    end
  end

end
