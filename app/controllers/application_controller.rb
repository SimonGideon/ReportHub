class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :redirect_admin_to_admin_login, if: :admin_user?

    private
    def admin_user?
        current_user&.admin?
      end
    
      def redirect_admin_to_admin_login
        redirect_to trestle.login_path
      end
end
