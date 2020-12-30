FactoryBot.define do
  factory :user_order do
    post_code     { "000-0000" }
    prefecture_id { "4" }
    city          { "市区町村" }
    addresses     { "番地" }
    building      { "建物名" }
    phone_no      { "09000000000" }
  end
end
