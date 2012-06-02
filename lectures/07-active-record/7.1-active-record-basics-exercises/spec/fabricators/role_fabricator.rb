Fabricator(:role) do
  name { Faker::Lorem.words }
  department { Faker::Lorem.words }
end
