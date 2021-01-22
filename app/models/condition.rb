class Condition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :age
  belongs_to :service
  has_one :medical_system, dependent: :destroy
end
