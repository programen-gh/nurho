class Service < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :company_id
    validates :name, length: { maximum: 50, message: "は50文字以内で入力してください" }
    validates :address
    validates :establishment
    validates :capacity, numericality: { only_integer: true }
    validates :rooms, numericality: { only_integer: true }
    validates :phone, format: { with: /\A[0-9]{10,11}\z/, message: "を正しく入力してください"}
    validates :explanation, length: { maximum: 200, message: "は200文字以内で入力してください" }
    validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :lump_sum_min, numericality: { less_than_or_equal_to: :lump_sum_max, message: "を正しく入力してください" }
    validates :lump_sum_max, numericality: { greater_than_or_equal_to: :lump_sum_min, message: "を正しく入力してください" }
    validates :monthly_sum_min, numericality: { less_than_or_equal_to: :monthly_sum_max, message: "を正しく入力してください" }
    validates :monthly_sum_max, numericality: { greater_than_or_equal_to: :monthly_sum_min, message: "を正しく入力してください" }
    validates :age_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :self_reliance
    validates :support_one
    validates :support_two
    validates :nursing_one
    validates :nursing_two
    validates :nursing_three
    validates :nursing_four
    validates :nursing_five
    validates :dementia
    validates :guarantor
    validates :welfare
    validates :take_care
    validates :care_food
    validates :liquid_food
    validates :rehabilitation
    validates :dm
    validates :gastrostomy
    validates :tube_feeding
    validates :stoma
    validates :home_oxygen_therapy
    validates :ventilator
    validates :bedsore
    validates :sputum_suction
    validates :dialysis
    validates :tracheostomy
    validates :ivh
    validates :catheter
    validates :pacemaker
    validates :als
    validates :aspiration_pneumonia
    validates :asthma
    validates :parkinson_disease
    validates :disuse_syndrome
    validates :clinical_depression
    validates :schizophrenia
    validates :rheumatism
    validates :osteoporosis
    validates :cerebral_infarction
    validates :myocardial_infarction
    validates :cancer
  end

  belongs_to :company
  has_many_attached :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  belongs_to :category
  belongs_to :prefecture
  belongs_to :age
end
