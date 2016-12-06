class Bill < ApplicationRecord
  belongs_to :calls
  has_many :biller
end
