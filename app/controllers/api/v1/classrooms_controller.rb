class Api::V1::ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find_by facility_code_heprod:(params[:facility_code_heprod].upcase)
    @classroom = @classroom.to_json
    render json: @classroom
  end

  def index
    #@classrooms = Classroom.all
    @classrooms = Classroom.pluck(:facility_code_heprod, :student_capacity)
    render json: @classrooms
  end
end
