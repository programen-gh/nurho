FactoryBot.define do
  factory :company do
    name                  { "test" }
    email                 { "test@example" }
    password              { "000000" }
    password_confirmation { password }
  end
end