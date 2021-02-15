FactoryBot.define do
  factory :user do
    nick_name { 'ササキさん' }
    last_name { '佐々木' }
    first_name { '雅也' }
    email { Faker::Internet.free_email }
    password = 'Masaya85'
    password { password }
    password_confirmation { password }
    last_name_kana { 'ササキ' }
    first_name_kana { 'マサヤ' }
    birth_date { '1999-07-19' }
  end
end
