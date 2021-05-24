class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :tweets
  # has_many :comments

  validates :nickname, 
    presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
    presence: true, 
    format: {with: VALID_EMAIL_REGEX, allow_blank: true},
    uniqueness: true
  
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, 
    presence: true, 
    length: { minimum: 6 },
    format: { with: VALID_PASSWORD_REGEX },
    confirmation: true
  
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name,
    presence: true,
    format: { with: VALID_NAME_REGEX }

  validates :first_name,
    presence: true,
    format: { with: VALID_NAME_REGEX }

  VALID_NAME_KANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  validates :last_name_kana,
    presence: true,
    format: {with: VALID_NAME_KANA_REGEX } 

  validates :first_name_kana,
    presence: true,
    format: {with: VALID_NAME_KANA_REGEX } 

  validates :birth_day,
    presence: true
end