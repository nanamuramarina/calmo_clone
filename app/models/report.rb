class Report < ApplicationRecord
  belongs_to :hotel, class_name: "Hotel"
  belongs_to :customer, class_name: "Customer"

  enum status: { 未対応: 0, 対応中: 1, 対応済み: 2 }
end
