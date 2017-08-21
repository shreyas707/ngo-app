class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_super_admin_status
  def index
  	@organizations = Organization.all
  end

  def new
  	@organization = Organization.new
  end
  def create
  	@organization = Organization.new(params[:organization].permit(:name,:state,:country, :type_of_organization))
    if @organization.save
  		redirect_to organizations_path, notice: "Organization successfully created!"
  	else
      render action:"new"
  	end
  end
  def edit
    @organization = Organization.find(params[:id])
  end
  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization].permit(:name, :country, :state, :type_of_organization))
      redirect_to organization_path(@organization.id), notice: "Organization successfully updated!"
    else
      render action:"edit"
    end
  end
  def show
    @organization = Organization.find(params[:id])
  end
  def destroy
    @organization = Organization.find(params[:id])
    if @organization.destroy
      redirect_to organizations_path, notice: "Organization deleted"
    else
      redirect_to organization_path(@organization.id), notice: "Try Again"
    end
  end
end
