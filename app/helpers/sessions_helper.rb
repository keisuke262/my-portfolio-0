module SessionsHelper
    #def current_userは現在ログインしているユーザを取得するメソッド
    def current_user
        @current_user ||= User.find_by(id: sessions[:user_id])
    end
    #ユーザがログインしていればtrueを返し、ログインしていなければfalseを返す
    def logged_in?
        !!current_user
    end
end
