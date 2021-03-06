class CoursesController < ApplicationController
  before_filter :find_course, 
    :only => [:show, :edit, :update, :destroy ] 
 
  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
    # TODO: build seems to put the empty record into db? or what?
    @party = @course.parties.new
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # POST /courses
  def create
    @course = Course.new(params[:course])

    if @course.save
      flash[:notice] = t(:create_success)
      redirect_to(@course)
    else
      render :action => "new"
    end
  end
  
  def destroy
    @course.destroy
    
    redirect_to courses_path
  end

private
  def find_course
    @course = Course.find(params[:id])
  end
end

