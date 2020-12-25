FactoryBot.define do
  factory :item do
    product_name    { '名前なまえ' }
    description     { '説明せつめいセツメイdescription' }
    category_id     { Faker::Number.between(from: 2, to: 11) }
    status_id       { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    duration_id     { Faker::Number.between(from: 2, to: 4) }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    trait :images do
      images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.png')) }
    end
  end
end
