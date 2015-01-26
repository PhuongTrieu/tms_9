class CoursesController < ApplicationController

  def index
  	@courses = Course.all
  end

  def new
  	@course = Course.new
  end

  def show
  	@course = Course.find(params[:id])
  end

  def create
  	@course = Course.new(course_params)
    if @course.save
      flash[:success] = "A new course has been created!"
      redirect_to courses_path
    else
      render 'new'
    end
  end

  private
  	def course_params
  		params.require(:course).permit(:name, :start_date, :end_date, :instruction)
  	end
end
