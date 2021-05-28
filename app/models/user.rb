class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :tweets
  # has_many :comments

  validates :nickname, 
    presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, 
    format: { with: VALID_PASSWORD_REGEX }
    
  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/} do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birth_day,
    presence: true
end