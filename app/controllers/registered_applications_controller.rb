class RegisteredApplicationsController < ApplicationController
  
  def index
    @user = current_user
    @registered_applications = @user.registered_applications.paginate(page: params[:page], per_page: 10)
    # @registered_applications = RegisteredApplication.visible_to(current_user).paginate(page: params[:page], per_page: 10)
    authorize @registered_applications
  end

  def new
    @registered_application = RegisteredApplication.new
    authorize @registered_application
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application
  end

  def create
    @user = current_user
    @registered_application = RegisteredApplication.new(registered_application_params)
    authorize @registered_application
    if @registered_application.save
      redirect_to @registered_application, notice: "Application was registered successfully."
    else
      flash[:error] = "Error registering application. Please try again."
      render :new
    end
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application
    if @registered_application.update_attributes(registered_application_params)
      redirect_to @registered_application
    else
      flash[:error] = "Error updating registered application. Please try again."
      render :edit
    end
  end


  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    name = @registered_application.name

    authorize @registered_application
    if @registered_application.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash[:error] = "Error deleting application. Please try again."
      render :show
    end
  end


  def registered_application_params
    params.require(:registered_application).permit(:name, :url, :description, :user_id)
  end


end
