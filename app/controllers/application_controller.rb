# frozen_string_literal: true

class ApplicationController < ActionController::Base

    # ControllerからHelperのメソッドを使うことは
    # デフォルトではできないのでincludeする
    # logged_in?はHelperで定義している
    
    include SessionsHelper

    private

    def require_user_logged_in
        unless logged_in?
            redirect_to root_url
        end
    end
end
