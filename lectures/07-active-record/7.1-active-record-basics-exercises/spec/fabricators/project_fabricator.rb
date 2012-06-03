Fabricator(:project) do
  name { Faker::Name.name }
  employees_count 3
  #employees
end
