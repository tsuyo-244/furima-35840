FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    shipping_origin_id { 1 }
    city { '東京都' }
    street { '1-1' }
    buliding { '東京ハイツ' }
    phone { '12312341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

