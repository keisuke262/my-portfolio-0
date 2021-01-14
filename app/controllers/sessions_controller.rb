# frozen_string_literal: true

class SessionsController < ApplicationController

  #application.html.erbを適用せずに
  #新たに作ったindex.html.erb(footer無し)を適用する
  layout 'index'

  def index
  end


  def create
    # newからcreateに送られてくるフォームデータは:sessionの中に入っている
    # session[:user_id]にログインユーザのidが代入された時点でログイン完了
    # このとき、ブラウザのCookieにログイン情報が保存される。
    name = params[:session][:name]
    password = params[:session][:password]
    if login(name, password)
      flash[:success] = 'Successfully logged in !'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to login_url
  end

  private

  def login(name, password)
    @user = User.find_by(name: name)
    if @user && @user.authenticate(password)
      #ログイン成功
      session[:user_id] = @user.id
      return true
    else
      #ログイン失敗
      return false
    end
  end
end
