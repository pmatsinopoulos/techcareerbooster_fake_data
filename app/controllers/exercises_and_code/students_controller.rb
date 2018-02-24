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

    private

    def populate_students
      students(100)
    end
  end
end
