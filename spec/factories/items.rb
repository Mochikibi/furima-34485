FactoryBot.define do
  factory :item do
    name { 'test' }
    explain { '面白い' }
    price { 1000 }
    category_id { 2 }
    sales_status_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 3 }
    scheduled_delivery_id { 2 }
    association :user
  end
end
