class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  before_action :authenticate_user!
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

   def access_denied!
    # TODO: implent access denied page
    render_404

    # respond_to do |format|

    #   format.html {render Rails.root.join("public", "404.html"), layout: false, :status => :unauthorized}
    #   format.json {render :status => :unauthorized, :text => "Access Denied"}
    # end
  end

  def render_404
    render file: Rails.root.join("public", "404"), layout: false, status: "404"
  end
  
  def configure_devise_permitted_parameters
    registration_params = [:username, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << [:current_password, :gender, :contact, :address_line1, :address_line2])
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
