class ServicesController < ApplicationController
  def index
    @services = Service.all.includes(:company, :favorites).order("favorites.user_id DESC")
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.valid?
      @service.save
      redirect_to controller: :companies, action: :index
    else
      render :new
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to controller: :companies, action: :index
  end

  def search
    @services = Service.search(params)
  end

  private

  def service_params
    params.require(:service).permit(:name, :address, :establishment, :capacity, :rooms, :phone, :explanation,
                                    :category_id, :prefecture_id, :lump_sum_min, :lump_sum_max, :monthly_sum_min, :monthly_sum_max, :age_id, :self_reliance, :support_one, :support_two,
                                    :nursing_one, :nursing_two, :nursing_three, :nursing_four, :nursing_five, :dementia, :guarantor, :welfare, :take_care,
                                    :care_food, :liquid_food, :rehabilitation, :dm, :gastrostomy, :tube_feeding, :stoma, :home_oxygen_therapy, :ventilator, :bedsore ,
                                    :sputum_suction, :dialysis, :tracheostomy, :ivh, :catheter, :pacemaker, :als, :aspiration_pneumonia, :asthma, :parkinson_disease,
                                    :disuse_syndrome, :clinical_depression, :schizophrenia, :rheumatism, :osteoporosis, :cerebral_infarction, :myocardial_infarction, :cancer, images: [])
                            .merge(company_id: current_company.id)
  end
end
