class Report < ApplicationRecord
  enum status: { waiting: 0, keep: 1, finish: 2 }
end
