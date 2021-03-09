class Item < ApplicationRecord
  has_one :record
  belongs_to :user
  has_one_attached :image

  # enum category:         ["レディース","メンズ","ベビー・キッズ","インテリア・住まい・小物","本・音楽・ゲーム","おもちゃ・ホビー・グッズ","家電・スマホ・カメラ","スポーツ・レジャー","ハンドメイド","その他"]
  # enum condition:         ["新品、未使用","未使用に近い","目立った傷や汚れなし","やや傷や汚れあり","傷や汚れあり","全体的に状態が悪い"]
  # enum postage_payer:  ["送料込み(出品者負担)","着払い(購入者負担)"]
  # enum prefecture:     ["1~2日で発送","2~3日で発送","4~7日で発送"]
  # enum preparation_day:   ["1~2日で発送","2~3日で発送","4~7日で発送"]

  VALID_PRICEL_REGEX =  /\A[0-9]+\z/
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  with_options presence: true do
    validates :name
    validates :introduction
    validates :text
  end

end