FactoryBot.define do
  factory :service_to_medical_system do
    images                { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test_image.png')) }
    name                  { "グループホーム" }
    address               { "東京都豊島区巣鴨4-5-6" }
    establishment         { "2020-1-1" }
    capacity              { 100 }
    rooms                 { 100 }
    phone                 { "0123456789" }
    explanation           { "綺麗な庭があります。" }
    category_id           { 2 }
    prefecture_id         { 2 }
    lump_sum_min          { 100 }
    lump_sum_max          { 5000 }
    monthly_sum_min       { 0 }
    monthly_sum_max       { 20.5 }
    age_id                { 2 }
    self_reliance         { 1 }
    support_one           { 1 }
    support_two           { 1 }
    nursing_one           { 1 }
    nursing_two           { 1 }
    nursing_three         { 1 }
    nursing_four          { 1 }
    nursing_five          { 1 }
    dementia              { 1 }
    guarantor             { 1 }
    welfare               { 1 }
    take_care             { 1 }
    care_food             { 1 }
    liquid_food           { 1 }
    rehabilitation        { 1 }
    dm                    { 1 }
    gastrostomy           { 1 }
    tube_feeding          { 1 }
    stoma                 { 1 }
    home_oxygen_therapy   { 1 }
    ventilator            { 1 }
    bedsore               { 1 }
    sputum_suction        { 1 }
    dialysis              { 1 }
    tracheostomy          { 1 }
    ivh                   { 1 }
    catheter              { 1 }
    pacemaker             { 1 }
    als                   { 1 }
    aspiration_pneumonia  { 1 }
    asthma                { 1 }
    parkinson_disease     { 1 }
    disuse_syndrome       { 1 }
    clinical_depression   { 1 }
    schizophrenia         { 1 }
    rheumatism            { 1 }
    osteoporosis          { 1 }
    cerebral_infarction   { 1 }
    myocardial_infarction { 1 }
    cancer                { 1 }

    #after(:build) do |service_to_medical_system|
    #  service_to_medical_system.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    #end
  end
end
