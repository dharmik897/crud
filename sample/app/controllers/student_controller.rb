class StudentController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student= Student.find(params[:id])
  end
  
  def create
    @student = Student.new(student_params)
  
    if @student.save
        redirect_to student_index_path
      else
        render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])
   
    if @student.update(student_params)
      redirect_to student_index_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
     
    redirect_to student_index_path
  end
  
  private

    def student_params
      params.require(:student).permit(:name, :email, :phone)
    end
end
