FactoryBot.define do
  factory :item do
    product            {Faker::Lorem.sentence}
    description        {Faker::Lorem.sentence}
    category_id        {2}
    condition_id       {2}
    shipping_cost_id   {2}
    shipping_origin_id {2}
    shipping_day_id    {2}
    price              {300}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
