class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

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
