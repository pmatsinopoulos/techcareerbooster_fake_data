module ExercisesAndCode
  class StudentsController < ApplicationController
    include StudentsArray

    def index
      # The problem with this is that we cannot do pagination because on every request, we get different
      # set of data. Can we use some cache?
      #
      # So, if the request does not contain "page" param, we create a new set and we save to the cache.
      # If the request contains "page" param, we read from the cache
      cache_key = 'students'

      if request.referer == root_url
        Rails.cache.delete(cache_key)
      end

      students = Rails.cache.fetch(cache_key) do
        populate_students
      end
      @students_with_pagination = Kaminari.paginate_array(students).page(params[:page].presence || 1).per(10)
    end

    def new
      @student = Student.new
    end

    def create
      @student = Student.new(student_params)
      if @student.save
        flash[:success] = 'Right! Student has been registered'
        redirect_to edit_exercises_and_code_student_path({id: @student.id, student: student_params})
      else
        flash.now[:error] = 'Please, correct the errors below'
        render :new
      end
    end

    def edit
      @student = Student.new({id: params[:id]}.merge(student_params))
    end

    def update
      @student = Student.new({id: params[:id]}.merge(student_params))
      if @student.save
        flash[:success] = 'Right! Student has been updated'
        redirect_to edit_exercises_and_code_student_path({id: @student.id, student: student_params})
      else
        flash.now[:error] = 'Please, correct the errors below'
        render :edit
      end
    end

    private

    def populate_students
      students(100)
    end

    def student_params
      params.require(:student).permit(:name, :email, :street_number, :city, :zip_code, :country)
    end
  end
end
