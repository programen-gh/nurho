class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def new
    @service_to_medical_system = ServiceToMedicalSystem.new
  end

  def create
    @service_to_medical_system = ServiceToMedicalSystem.new(service_to_medical_system_params)
    if @service_to_medical_system.valid?
      @service_to_medical_system.save
      redirect_to controller: :companies, action: :index
    else
      render :new
    end
  end

  private

  def service_to_medical_system_params
    params.require(:service_to_medical_system).permit(:name, :address, :establishment, :capacity, :rooms, :phone, :explanation,
                                                      :category_id, :prefecture_id, :lump_sum_min, :lump_sum_max, :monthly_sum_min, :monthly_sum_max, :age_id, :self_reliance, :support_one, :support_two,
                                                      :nursing_one, :nursing_two, :nursing_three, :nursing_four, :nursing_five, :dementia, :guarantor, :welfare, :take_care,
                                                      :care_food, :liquid_food, :rehabilitation, :dm, :gastrostomy, :tube_feeding, :stoma, :home_oxygen_therapy, :ventilator, :bedsore ,
                                                      :sputum_suction, :dialysis, :tracheostomy, :ivh, :catheter, :pacemaker, :als, :aspiration_pneumonia, :asthma, :parkinson_disease,
                                                      :disuse_syndrome, :clinical_depression, :schizophrenia, :rheumatism, :osteoporosis, :cerebral_infarction, :myocardial_infarction, :cancer, images: [])
                                              .merge(company_id: current_company.id)
  end
end
