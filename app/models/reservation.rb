class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :menu

  enum payment_method: { クレジットカード: 0 }
  enum status: { 宿泊予定: 0, 宿泊中: 1, 宿泊済み: 2, キャンセル: 3}

   with_options presence: true do
    validates :start_reservation_date
    validates :start_reservation_time
  end

   with_options presence: true do
    validates :end_reservation_date
    validates :end_reservation_time
  end

  with_options numericality: { only_integer: true } do
    validates :customer_id
    validates :menu_id
    validates :number
  end

  validates :number, presence: true
end
