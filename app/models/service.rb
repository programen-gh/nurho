class Service < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :company
  has_one :condition, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  belongs_to :category
  belongs_to :prefecture
  belongs_to :age
  belongs_to :service
end
