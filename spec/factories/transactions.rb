FactoryBot.define do
  factory :transaction do
    invoice { create(:invoice) }
    credit_card_number { 12345 }
    credit_card_expiration_date { "" }
    result { "success" }
  end
end
