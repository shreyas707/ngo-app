class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin_status
  def index
    if current_user.role_id == 3
      @users = User.where('organization_id = ?', current_user.organization_id)
    else
  	 @users = User.all
    end
  end
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end
  def create
  	@user = User.new(params[:user].permit(:name, :email, :dob, :role_id, :password, :password_confirmation,:organization_id))
    unless @user.role_id == 2 || @user.role_id == 3
      @user.organization_id =  Organization.find_by(name:"Educator Placeholder")
    end
  	if @user.save
      if @user.role_id == 2
        redirect_to new_learner_path(user_id: @user.id), notice: "Just a couple more details! Thanks."
      else
  		redirect_to admin_user_path(@user.id), notice: "User successfully created!"
      end
  	else 
  		render action:"new"
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user].permit(:name, :email, :dob, :role_id, :password))
  		redirect_to admin_user_path(@user.id), notice: "User updated!"
  	else 
  		render action:"edit"
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
  		redirect_to admin_users_path, notice: "User deleted"
      if Learner.find_by(user_id: @user.id)
        Learner.find_by(user_id: @user.id).destroy
      end
  	else
  		redirect_to admin_user_path(@user.id), notice: "Try again"
  	end
  end
end
