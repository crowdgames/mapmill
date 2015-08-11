require 'uri'


class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_user
  before_action :allow_iframe_requests
  helper_method :logged_in?

  def current_user
    user_id = session[:user_id] 
    if user_id
      begin
        @user = User.find(user_id)
      rescue
        @user = nil
      end
    else
      @user = nil
    end
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  private
    def allow_iframe_requests
      response.headers.delete('X-Frame-Options')
     # response.headers['X-Frame-Options']="none"
    end    

    def require_login
      unless logged_in?
        path_info = request.env['PATH_INFO']
        flash[:warning] = "You must be logged in to access this section"
        redirect_to '/show_login?back_to=' + URI.encode(path_info) # halts request cycle
      end
    end

    def logged_in?
      user_id = session[:user_id]

      begin
        if user_id and User.find(user_id)
          return true
        else
          return false
        end
      rescue
        return false
      end
    end

end
