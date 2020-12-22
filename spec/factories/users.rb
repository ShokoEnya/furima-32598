FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name_kanji       { '阿あア' }
    first_name_kanji      { '阿あア' }
    last_name_kana        { 'アアア' }
    first_name_kana       { 'アアア' }
    date_of_birth         { Faker::Date.between(from: '1930-01-01', to: '2020-12-31') }
  end
end
