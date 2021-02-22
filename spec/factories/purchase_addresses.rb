FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '愛知県' }
    house_number { '青山1-1-1' }
    phone_number { '09043335656' }
    building_name { 'サイコー' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
