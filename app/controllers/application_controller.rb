class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Whitelist the form fields
  protected

  def configure_permitted_parameters
    # rubocop:disable  Layout/LineLength
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) }
    # rubocop:enable  Layout/LineLength
  end
end
