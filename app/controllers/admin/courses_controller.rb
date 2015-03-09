class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = "A new course has been created successfully!"
      redirect_to admin_courses_path
    else
      redirect_to new_admin_course_path
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :start_date, :end_date,
                                  :instruction, :subject_ids => []
  end
end
