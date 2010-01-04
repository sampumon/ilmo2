class PartiesController < ApplicationController
  before_filter :find_course
  before_filter :find_party, :only => [:show]

  def show
    @group = @party.groups.new
  end
  
  def new
    # @party = Party.new(:course_id => params[:course_id])
    @party = @course.parties.build
  end
  
  def create
    @party = @course.parties.build(params[:party])
    
    if @party.save
      flash[:notice] = 'Party was successfully created.'
    else
      flash[:notice] = 'NOT SUCCESS.'
      # render :action => "new"
    end

    redirect_to course_path(params[:course_id])
  end

private
  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_party
    @party = Party.find(params[:id])
  end  
end
