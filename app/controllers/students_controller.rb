class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update]
  
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    if @student.active == false
      @activity = "This student is currently inactive"
    else 
      @activity = "This student is currently active."
    end
  end

  def update
    @student.toggle!(:active)
    redirect_to student_path(@student)
  end





  private

    def set_student
      @student = Student.find(params[:id])
    end

end