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
    validates :images
  end

  belongs_to :company
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many_attached :images, dependent: :destroy
  belongs_to :category
  belongs_to :prefecture
  belongs_to :age

  def self.search(search_params)
    lump_sum(search_params[:lump_sum]).monthly_sum(search_params[:monthly_sum]).prefecture(search_params[:prefecture_id]).category(search_params[:category_id]).age(search_params[:age_id]).nursing_degree(search_params[:nursing_degree]).
    guarantor(search_params[:guarantor]).welfare(search_params[:welfare]).dementia(search_params[:dementia]).take_care(search_params[:take_care]).care_food(search_params[:care_food]).liquid_food(search_params[:liquid_food]).
    rehabilitation(search_params[:rehabilitation]).dm(search_params[:dm]).gastrostomy(search_params[:gastrostomy]).tube_feeding(search_params[:tube_feeding]).stoma(search_params[:stoma]).home_oxygen_therapy(search_params[:home_oxygen_therapy]).
    ventilator(search_params[:ventilator]).bedsore(search_params[:bedsore]).sputum_suction(search_params[:sputum_suction]).dialysis(search_params[:dialysis]).ivh(search_params[:ivh]).catheter(search_params[:catheter]).
    pacemaker(search_params[:pacemaker]).als(search_params[:als]).aspiration_pneumonia(search_params[:aspiration_pneumonia]).asthma(search_params[:asthma]).parkinson_disease(search_params[:parkinson_disease]).disuse_syndrome(search_params[:disuse_syndrome]).
    clinical_depression(search_params[:clinical_depression]).clinical_depression(search_params[:clinical_depression]).schizophrenia(search_params[:schizophrenia]).rheumatism(search_params[:rheumatism]).osteoporosis(search_params[:osteoporosis]).
    cerebral_infarction(search_params[:cerebral_infarction]).myocardial_infarction(search_params[:myocardial_infarction]).cancer(search_params[:cancer])
  end

  scope :lump_sum, -> lump_sum_params do
    unless lump_sum_params == "1"
      case lump_sum_params
      when "2"
        x = 0; y = 0
      when "3"
        x = 0; y = 10
      when "4"
        x = 10; y = 20
      when "5"
        x = 20; y = 50
      when "6"
        x = 50; y = 100
      when "7"
        x = 100; y = 200
      when "8"
        x = 200; y = 500
      when "9"
        x = 500; y = 1000
      when "10"
        x = 1000; y = 2000
      when "11"
        x = 2000; y = 5000
      when "12"
        x = 5000; y = 10000
      end
      where("lump_sum_max >= ? and lump_sum_max <= ?", x, y)
    end
  end

  scope :monthly_sum, -> monthly_sum_params do
    unless monthly_sum_params == "1"
      case monthly_sum_params
      when "2"
        x = 0; y = 0
      when "3"
        x = 0; y = 5
      when "4"
        x = 5; y = 10
      when "5"
        x = 10; y = 15
      when "6"
        x = 15; y = 20
      when "7"
        x = 20; y = 30
      when "8"
        x = 30; y = 40
      when "9"
        x = 40; y = 50
      when "10"
        x = 50; y = 60
      when "11"
        x = 60; y = 70
      when "12"
        x = 70; y = 80
      when "13"
        x = 80; y = 90
      when "14"
        x = 90; y = 100
      when "15"
        x = 100; y = 1000
      end
      where("monthly_sum_max >= ? and monthly_sum_max <= ?", x, y)
    end
  end

  scope :prefecture, -> (prefecture_id){ where(prefecture_id: prefecture_id) unless prefecture_id == "1"}
  scope :category, -> (category_id){ where(category_id: category_id) unless category_id == "1"}
  scope :age, -> (age_id){ where(age_id: age_id) unless age_id == "1"}

  scope :nursing_degree, -> nursing_degree_params do
    case nursing_degree_params
    when "2"
      where(self_reliance: [1,2])
    when "3"
      where(support_one: [1,2])
    when "4"
      where(support_two: [1,2])
    when "5"
      where(nursing_one: [1,2])
    when "6"
      where(nursing_two: [1,2])
    when "7"
      where(nursing_three: [1,2])
    when "8"
      where(nursing_four: [1,2])
    when "9"
      where(nursing_five: [1,2])
    end
  end

  scope :guarantor, -> (guarantor_params){ where(guarantor: [1,2]) if guarantor_params == "true"}
  scope :welfare, -> (welfare_params){ where(welfare: [1,2]) if welfare_params == "true"}
  scope :dementia, -> (dementia_params){ where(dementia: [1,2]) if dementia_params == "true"}
  scope :take_care, -> (take_care_params){ where(take_care: [1,2]) if take_care_params == "true"}
  scope :care_food, -> (care_food_params){ where(care_food: [1,2]) if care_food_params == "true"}
  scope :liquid_food, -> (liquid_food_params){ where(liquid_food: [1,2]) if liquid_food_params == "true"}
  scope :rehabilitation, -> (rehabilitation_params){ where(rehabilitation: [1,2]) if rehabilitation_params == "true"}
  scope :dm, -> (dm_params){ where(dm: [1,2]) if dm_params == "true"}
  scope :gastrostomy, -> (gastrostomy_params){ where(gastrostomy: [1,2]) if gastrostomy_params == "true"}
  scope :tube_feeding, -> (tube_feeding_params){ where(tube_feeding: [1,2]) if tube_feeding_params == "true"}
  scope :stoma, -> (stoma_params){ where(stoma: [1,2]) if stoma_params == "true"}
  scope :home_oxygen_therapy, -> (home_oxygen_therapy_params){ where(home_oxygen_therapy: [1,2]) if home_oxygen_therapy_params == "true"}
  scope :ventilator, -> (ventilator_params){ where(ventilator: [1,2]) if ventilator_params == "true"}
  scope :bedsore, -> (bedsore_params){ where(bedsore: [1,2]) if bedsore_params == "true"}
  scope :sputum_suction, -> (sputum_suction_params){ where(sputum_suction: [1,2]) if sputum_suction_params == "true"}
  scope :dialysis, -> (dialysis_params){ where(dialysis: [1,2]) if dialysis_params == "true"}
  scope :ivh, -> (ivh_params){ where(ivh: [1,2]) if ivh_params == "true"}
  scope :catheter, -> (catheter_params){ where(catheter: [1,2]) if catheter_params == "true"}
  scope :pacemaker, -> (pacemaker_params){ where(pacemaker: [1,2]) if pacemaker_params == "true"}
  scope :als, -> (als_params){ where(als: [1,2]) if als_params == "true"}
  scope :aspiration_pneumonia, -> (aspiration_pneumonia_params){ where(aspiration_pneumonia: [1,2]) if aspiration_pneumonia_params == "true"}
  scope :asthma, -> (asthma_params){ where(asthma: [1,2]) if asthma_params == "true"}
  scope :parkinson_disease, -> (parkinson_disease_params){ where(parkinson_disease: [1,2]) if parkinson_disease_params == "true"}
  scope :disuse_syndrome, -> (disuse_syndrome_params){ where(disuse_syndrome: [1,2]) if disuse_syndrome_params == "true"}
  scope :clinical_depression, -> (clinical_depression_params){ where(clinical_depression: [1,2]) if clinical_depression_params == "true"}
  scope :schizophrenia, -> (schizophrenia_params){ where(schizophrenia: [1,2]) if schizophrenia_params == "true"}
  scope :rheumatism, -> (rheumatism_params){ where(rheumatism: [1,2]) if rheumatism_params == "true"}
  scope :osteoporosis, -> (osteoporosis_params){ where(osteoporosis: [1,2]) if osteoporosis_params == "true"}
  scope :cerebral_infarction, -> (cerebral_infarction_params){ where(cerebral_infarction: [1,2]) if cerebral_infarction_params == "true"}
  scope :myocardial_infarction, -> (myocardial_infarction_params){ where(myocardial_infarction: [1,2]) if myocardial_infarction_params == "true"}
  scope :cancer, -> (cancer_params){ where(cancer: [1,2]) if cancer_params == "true"}
end
