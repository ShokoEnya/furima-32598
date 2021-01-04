FactoryBot.define do
  factory :user_order do
    token         { 'tok_abcdef0000000000000' }
    post_code     { '000-0000' }
    prefecture_id { '4' }
    city          { '市区町村' }
    addresses     { '番地' }
    building      { '建物名' }
    phone_no      { '09000000000' }
    item_id       { '1' }
    seller_id     { '1' }
  end
end
