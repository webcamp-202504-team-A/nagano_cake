class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :postal_code,
    presence: true,
    format: {
      with: /\A\d{7}\z/,
      message: "7桁の数字で入力してください（ハイフン不要）"
    },
    length: {
      is: 7,
      message: "桁で入力してください"
    }
  validates :address, presence: true
end
