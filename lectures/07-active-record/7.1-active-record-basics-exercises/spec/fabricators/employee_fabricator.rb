Fabricator(:employee) do
  name { Faker::Name.name }
  address { Faker::Address.street_address }
  start_date Time.now
  role
end
