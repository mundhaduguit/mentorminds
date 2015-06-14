class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  def after_login
    if current_user.sign_in_count > 1 && current_user.has_role?(:mentee)
      redirect_to mentee_pages_index_path
    elsif current_user.sign_in_count > 1     
      redirect_to progress_user_challenges_path      
    else
      redirect_to edit_user_path(current_user.id)
    end
  end
end
