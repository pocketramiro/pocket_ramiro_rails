class ApplicationController < ActionController::API

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_admin
      @current_user && @current_user.admin?
    end

    def current_manager
      @current_user && @current_user.facilities_manager?
    end

    def current_brewer
      @current_user && @current_user.brewer?
    end

    def current_packaging
      @current_user && @current_user.packaging?
    end
end
