class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?


	def verify_admin_status
		if current_user.role_id == 1 || current_user.role_id == 3
			return true
		else 
			redirect_to root_path, notice: "The page you're looking for doesn't exist"
		end
	end
	def verify_super_admin_status
		if current_user.role_id == 1
			return true
		else
			redirect_to root_path, notice: "The page you're looking for doesn't exist"
		end
	end
	def verify_educator_status
		if current_user.role_id == 4 || current_user.role_id == 5
			return true
		else
			redirect_to root_path, notice: "The page you're looking for doesn't exist"
		end
	end

  def after_sign_in_path_for(current_user)
  	if current_user.sign_in_count == 1 && (current_user.role_id == 4 || current_user.role_id == 5)
		 new_educator_path
	else
		 root_path
	end 
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :dob, :role_id, :organization_id])
  end
end
