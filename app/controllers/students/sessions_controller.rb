class Students::SessionsController < Devise::SessionsController

# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    email = params[:student][:email]
    password = params[:student][:password]
    admin = AdminUser.find_by(email: email)
    if admin && admin.valid_password?(password)
      sign_in admin
      redirect_to admin_dashboard_path
    else
      staff = Staff.find_by(email: email)
      if staff && staff.valid_password?(password)
        sign_in staff
        redirect_to root_path
      else
        super
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out current_user
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  def after_sign_in_path_for(resource)
    student_dashboards_path(resource)
  end
end
