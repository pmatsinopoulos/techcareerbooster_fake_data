require 'faker'

module Api
  module ExercisesAndCode
    class StudentsController < Api::Controller
      def index
        @students = []

        100.times do
          @students <<
              {id: SecureRandom.hex,
               name: Faker::Name.name,
               email: Faker::Internet.email,
               address: {street_number: Faker::Address.street_address,
                         city: Faker::Address.city,
                         zip_code: Faker::Address.zip_code,
                         country: Faker::Address.country}
              }
        end
        render json: {description: "This is random data generated to support TCB (#{root_url}) exercises",
                      type_of_results: 'students',
                      number_of_results: @students.size,
                      results: @students}
      end
    end
  end
end
