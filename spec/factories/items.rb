FactoryBot.define do
  factory :item do
    name { "Product" }
    description { "To use" }
    unit_price { 100 }
    merchant { create(:merchant) }
  end
end
