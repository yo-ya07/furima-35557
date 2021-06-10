FactoryBot.define do
  factory :purchase_address do
    postcode              { '123-4567' }
    region_id             { 15 }
    city                  { '横浜市緑区' }
    street_address        { '青山1-1-1' }
    state                 { '柳ビル103' }
    phone_number          { '09012345678' }
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
