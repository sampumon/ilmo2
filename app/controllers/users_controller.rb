class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def login
    user = User.authenticate(params[:user], params[:pass])
    
    if user
      session[:user_id] = user.id
    else
      flash[:warning] = "Bad user or password!"
      flash[:user] = params[:user]
    end

    # we might arrive here from other controllers, too!
    redirect_to request.referer or users_path
  end
  
  def logout
    session[:user_id] = nil
    redirect_to request.referer or users_path
  end

  def new
    @newuser = User.new
  end

  def create
    @newuser = User.new(params[:user])

    if @newuser.save
      flash[:notice] = "User #{@newuser.name} created."
      redirect_to users_path
    else
      render :action => :new
    end
  end
  
  def destroy
   @user = User.find(params[:id])
   if @user.destroy then flash[:notice] = "User #{@user.name} deleted." end
   redirect_to users_path
  end

  def edit
    @olduser = User.find(params[:id])
  end
  
  def update
    @olduser = User.find(params[:id])

    if @olduser.update_attributes(params[:user])
      flash[:notice] = "User #{@olduser.name} updated."
      redirect_to users_path
    else
      render :action => :edit
    end
  end

end
