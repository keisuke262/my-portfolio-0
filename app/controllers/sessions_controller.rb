class SessionsController < ApplicationController
  def new
  end

  def create
    #newからcreateに送られてくるフォームデータは:sessionの中に入っている
    #session[:user_id]にログインユーザのidが代入された時点でログイン完了
    #このとき、ブラウザのCookieにログイン情報が保存される。    
    name = params[:session][:name]
    password = params[:session][:password]
    if login(name, password)
      flash[:success] = 'Successfully logged in !'
      redirect_to @user
    else
  end

  def destroy
  end
end
end

