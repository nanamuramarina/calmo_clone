class Report < ApplicationRecord
  belongs_to :hotel, class_name: "Hotel"
  belongs_to :customer, class_name: "Customer"

  enum status: { waiting: 0, keep: 1, finish: 2 }
end
