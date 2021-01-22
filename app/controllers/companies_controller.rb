class CompaniesController < ApplicationController
  def index
    if company_signed_in?
      @company = Company.find(current_company.id)
      @services = @company.services
    end
  end
end
