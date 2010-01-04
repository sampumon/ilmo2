class GroupsController < ApplicationController
  before_filter :find_course_and_party
  before_filter :find_group, :only => [:show, :pool]

  def show
  end

  def new
    @group = @party.groups.build
  end

  def create
    @group = @party.groups.build(params[:group])
    
    if @group.save
      flash[:notice] = 'Group was successfully created.'
    else
      flash[:warning] = 'CREATE NOT SUCCESS.'
      # render :action => "new"
    end

    redirect_to course_party_path(params[:course_id], params[:party_id])
  end

  # register into group
  # @logged_user comes from application_controller, nil if not logged in
  def pool

    #begin
      if @group.pool_in @logged_user
        flash[:notice] = 'Pool success.'
      else
        flash[:notice] = 'Pool queued.'
      end      
    #rescue => e
    #  flash[:warning] = 'NO POOL SUCCESS: ' + e.to_s
    #end

    redirect_to course_party_group_path(params[:course_id], params[:party_id], params[:id])
  end

private
  def find_course_and_party
    @course = Course.find(params[:course_id])
    @party = Party.find(params[:party_id])
  end
  
  def find_group
    @group = Group.find(params[:id])
  end
end
