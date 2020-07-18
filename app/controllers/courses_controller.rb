class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_admin, only: [:new, :destroy]
  before_action :require_course_admin, only: [:edit, :update]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Object successfully created"
      redirect_to @course
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:success] = "course was successfully updated"
      redirect_to @course
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = "Course was successfully deleted."
      redirect_to courses_url
    else
      flash[:error] = "Something went wrong"
      redirect_to @course
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :course_outline, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end

end
