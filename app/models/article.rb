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
class Article < ApplicationRecord
    belongs_to :user
    has_many :comments
    
    validates   :title, 
                presence: { message: "tem de ter um titulo bro"},
                length: { minimum: 5 }
    validate   :validate_published_article

    def validate_published_article
        if is_published && title.length < 5 && text.length == 0
            errors.add(:is_published, "erro tamanho")
        end
    end
end
