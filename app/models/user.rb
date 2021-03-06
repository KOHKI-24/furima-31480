class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end


  with_options presence: true, format: { with: /\A[ｧ-ﾝﾞﾟ]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :family_name_kana
  end

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end
end


