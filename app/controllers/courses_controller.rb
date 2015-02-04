class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
  	@course = Course.new
  	@subjects = Subject.all
  end

  def create
    # debugger
    @course = Course.new(course_params)

    subject_ids.each do |sub_id|
      @course.subjects << Subject.find(sub_id)
    end

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

  def subject_ids
    params[:course][:subject_ids]
  end
end
