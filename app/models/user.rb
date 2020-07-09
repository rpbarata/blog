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
class User < ApplicationRecord
  has_many :articles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :encrypted_password, :email, presence: true


  # validates :username, presence: {message: "Teste: Cena vazia!"}, if: -> { username.blank? }
#   validates :username,  length: { in: 3..10 }, 
#                         format: { with: /\A[a-zA-Z]+\z/ }, 
#                         uniqueness: true,
#                         unless: Proc.new { |a| a.username.present? }

end
