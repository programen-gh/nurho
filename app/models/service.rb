class Service < ApplicationRecord
  belongs_to :company
  has_one :condition, dependent: :destroy
  has_many_attached :images, dependent: :destroy
end
