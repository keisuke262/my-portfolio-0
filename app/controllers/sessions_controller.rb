# frozen_string_literal: true

class SessionsController < ApplicationController

  #Loginページだけapplication.html.erbを適用せずに
  #新たに作ったindex.html.erb(navとfooter無し)を適用する
  layout 'index'

  def index
  end

  def new; end

  def create
    render layout: false
    # newからcreateに送られてくるフォームデータは:sessionの中に入っている
    # session[:user_id]にログインユーザのidが代入された時点でログイン完了
    # このとき、ブラウザのCookieにログイン情報が保存される。
    name = params[:session][:name]
    password = params[:session][:password]
    if login(name, password)
      flash[:success] = 'Successfully logged in !'
      redirect_to @user
    end

    def destroy; end
  end
end
