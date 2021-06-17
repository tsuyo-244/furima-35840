class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :items
   has_many :buys

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 
    
  with_options presence: true do
    validates :nickname, :l_name, :f_name, :l_name_kana, :f_name_kana, :birthday
    validates :l_name, :f_name, format: { with: NAME_REGEX }
    validates :l_name_kana, :f_name_kana, format: { with: NAME_KANA_REGEX }
  end
end
