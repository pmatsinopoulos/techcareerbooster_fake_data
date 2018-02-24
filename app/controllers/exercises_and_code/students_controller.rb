module ExercisesAndCode
  class StudentsController < ApplicationController
    include StudentsArray

    def index
      @students = students(100)
    end
  end
end
