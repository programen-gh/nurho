class Service < ApplicationRecord
  belongs_to :company
  has_one :condition
  has_many_attached :images
end
