class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: %i[show edit update destroy]
    def index
        # error handling when current user is present
        if current_user.present?
            @user = current_user
        else
            redirect_to new_user_session_path
        end

    end
end
