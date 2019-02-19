class StudentController < ApplicationController
  before_action :find_record, only: %i[edit show update destroy]
  def index
    @students = Student.all
  end
  def show; end
  def new
    @student = Student.new
  end
  def edit; end
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_index_path
    else
      render 'new'
    end
  end
  def update
    if @student.update(student_params)
      redirect_to student_index_path
    else
      render 'edit'
    end
  end
  def destroy
    @student.destroy
    redirect_to student_index_path
  end
  
  private

    def student_params
      params.require(:student).permit(:name, :email, :phone)
    end
    def find_record
      @student= Student.find_by(id: params[:id])
    end

end
