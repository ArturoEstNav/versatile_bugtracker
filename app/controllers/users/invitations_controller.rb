class Users::InvitationsController < Devise::InvitationsController
   skip_before_action :require_no_authentication, only: [:new]

  def new
    super
  end
end
