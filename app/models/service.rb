class Service < ApplicationRecord
  belongs_to :company
  has_one :condition
  has_one_attached :image
end
