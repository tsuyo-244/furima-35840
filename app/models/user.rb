class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items

         PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
         NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/.freeze
         NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
         with_options  presence: true do
           validates :password, format: { with: PASSWORD_REGEX}
           validates :nickname, :l_name, :f_name, :l_name_kana, :f_name_kana, :birthday
           validates :l_name, :f_name, format: { with: NAME_REGEX}
           validates :l_name_kana, :f_name_kana, format: { with: NAME_KANA_REGEX}
         end
end
