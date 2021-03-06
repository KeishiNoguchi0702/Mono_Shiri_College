class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTHEN_USER'] && password == ENV['BASIC_AUTHEN_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:certificate_number,
                                             :last_name,
                                             :first_name,
                                             :last_name_kana,
                                             :first_name_kana,
                                             :department_id,
                                             :sex_id,
                                             :position_id,
                                             :profile,
                                             :image])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:certificate_number,
                                             :last_name,
                                             :first_name,
                                             :last_name_kana,
                                             :first_name_kana,
                                             :department_id,
                                             :sex_id,
                                             :position_id,
                                             :profile,
                                             :image])
  end
end
