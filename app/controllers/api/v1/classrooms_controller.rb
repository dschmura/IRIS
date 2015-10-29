class Api::V1::ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find_by facility_code_heprod:(params[:facility_code_heprod].upcase)
    render json: @classroom
  end

  def index
    @classrooms = Classroom.all
    render json: @classrooms
  end
end
