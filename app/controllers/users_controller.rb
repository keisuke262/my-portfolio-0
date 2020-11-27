class UsersController < ApplicationController
    def index
        #ページネーションを適用させるためにpage(params[:page])をつけている
        @users = User.order(id: :desc).page(params[:page]).per(5)
    end
end
