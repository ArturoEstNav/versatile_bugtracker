class Users::InvitationsController < Devise::InvitationsController
  skip_before_action :require_no_authentication, only: [:new]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite,
                                      keys: [
                                      :first_name,
                                      :last_name,
                                      :employee_number,
                                      :admin
                                      ])
  end
end
