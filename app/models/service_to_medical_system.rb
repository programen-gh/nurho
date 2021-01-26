class ServiceToMedicalSystem
  include ActiveRecord::AttributeAssignment
  include ActiveModel::Model
  attr_accessor :company_id, :images, :name, :address, :establishment, :capacity, :rooms, :phone, :explanation,
                :service_id, :category_id, :prefecture_id, :lump_sum_min, :lump_sum_max, :monthly_sum_min, :monthly_sum_max, :age_id, :self_reliance, :support_one,
                :support_two, :nursing_one, :nursing_two, :nursing_three, :nursing_four, :nursing_five, :dementia, :guarantor, :welfare, :take_care,
                :condition_id, :care_food, :liquid_food, :rehabilitation, :dm, :gastrostomy, :tube_feeding, :stoma, :home_oxygen_therapy, :ventilator,
                :bedsore, :sputum_suction, :dialysis, :tracheostomy, :ivh, :catheter, :pacemaker, :als, :aspiration_pneumonia, :asthma,
                :parkinson_disease, :disuse_syndrome, :clinical_depression, :schizophrenia, :rheumatism, :osteoporosis, :cerebral_infarction, :myocardial_infarction, :cancer
  
  

  def save
    service = Service.create(company_id: company_id, images: images, name: name, address: address, establishment: establishment, capacity: capacity, rooms: rooms, phone: phone, explanation: explanation)
    condition = Condition.create(service_id: service.id, category_id: category_id, prefecture_id: prefecture_id, lump_sum_min: lump_sum_min, lump_sum_max: lump_sum_max, monthly_sum_min: monthly_sum_min, monthly_sum_max: monthly_sum_min, age_id: age_id, self_reliance: self_reliance, support_one: support_one,
                                  support_two: support_two, nursing_one: nursing_one, nursing_two: nursing_two, nursing_three: nursing_three, nursing_four: nursing_four, nursing_five: nursing_five, dementia: dementia, guarantor: guarantor, welfare: welfare, take_care: take_care)
    MedicalSystem.create(condition_id: condition.id, care_food: care_food, liquid_food: liquid_food, rehabilitation: rehabilitation, dm: dm, gastrostomy: gastrostomy, tube_feeding: tube_feeding, stoma: stoma, home_oxygen_therapy: home_oxygen_therapy, ventilator: ventilator,
                          bedsore: bedsore, sputum_suction: sputum_suction, dialysis: dialysis, tracheostomy: tracheostomy, ivh: ivh, catheter: catheter, pacemaker: pacemaker, als: als, aspiration_pneumonia: aspiration_pneumonia, asthma: asthma,
                          parkinson_disease: parkinson_disease, disuse_syndrome: disuse_syndrome, clinical_depression: clinical_depression, schizophrenia: schizophrenia, rheumatism: rheumatism, osteoporosis: osteoporosis, cerebral_infarction: cerebral_infarction, myocardial_infarction: myocardial_infarction, cancer: cancer)
  end

  def self.search
    Service.joins(:condition).where(category_id: category_id, prefecture_id: prefecture_id, lump_sum_min: lump_sum_min, lump_sum_max: lump_sum_max, monthly_sum_min: monthly_sum_min, monthly_sum_max: monthly_sum_min, age_id: age_id, self_reliance: self_reliance, support_one: support_one,
      support_two: support_two, nursing_one: nursing_one, nursing_two: nursing_two, nursing_three: nursing_three, nursing_four: nursing_four, nursing_five: nursing_five, dementia: dementia, guarantor: guarantor, welfare: welfare, take_care: take_care)
  end
end