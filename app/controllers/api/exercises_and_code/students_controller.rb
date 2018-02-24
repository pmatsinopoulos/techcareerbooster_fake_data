require 'faker'

module Api
  module ExercisesAndCode
    class StudentsController < Api::Controller
      include StudentsArray

      before_action :set_allow_any_origin, only: :index
      before_action :set_allow_get_method, only: :index

      def index
        students = students(100)
        result = {description: "This is random data generated to support TCB (https://www.techcareerbooster.com) exercises",
                  type_of_results: 'students',
                  number_of_results: students.size,
                  results: students}

        respond_to do |format|
          format.xml {render xml: result}
          format.json {render json: result}
        end
      end

      private

      def set_allow_any_origin
        response.set_header('Access-Control-Allow-Origin', '*')
      end

      def set_allow_get_method
        response.set_header('Access-Control-Allow-Methods', 'GET')
      end
    end
  end
end
