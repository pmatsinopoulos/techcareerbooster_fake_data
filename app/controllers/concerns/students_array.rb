require 'faker'

module StudentsArray
  extend ActiveSupport::Concern

  def students(number_of_students)
    Array.new(number_of_students) do
      {id: SecureRandom.hex,
       name: Faker::Name.name,
       email: Faker::Internet.email,
       address: {street_number: Faker::Address.street_address,
                 city: Faker::Address.city,
                 zip_code: Faker::Address.zip_code,
                 country: Faker::Address.country}
      }
    end
  end
end
