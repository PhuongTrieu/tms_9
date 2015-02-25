class Admin::CoursesController < ApplicationController
	def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

	def new
    @course = Course.new
  end

  def create
    # debugger
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "A new course has been created successfully!"
      redirect_to admin_courses_path
    else
      redirect_to new_admin_course_path
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      flash[:success] = "Course has been update successfully!"
      redirect_to admin_course_path(@course)
    end
  end

  def destroy
    @course = Course.find(params[:id])

    if @course.destroy
      flash[:success] = "Course has been deleted successfully!"
      redirect_to admin_courses_path
    end
  end

  private
  def course_params
    params.require(:course).permit(:name, :start_date, :end_date,
                                  :instruction, :subject_ids => [])
  end
end
