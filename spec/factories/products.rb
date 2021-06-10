FactoryBot.define do
  factory :product do
    name                  { 'aaa' }
    info                  { 'bbb' }
    category_id           { 2 }
    status_id             { 2 }
    postage_id            { 2 }
    region_id             { 2 }
    shipping_date_id      { 2 }
    price                 { 1000 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
    end
  end
end
