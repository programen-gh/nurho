class Service < ApplicationRecord
  belongs_to :company
  has_one :condition, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
