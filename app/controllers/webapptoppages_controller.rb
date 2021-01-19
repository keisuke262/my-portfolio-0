class WebapptoppagesController < ApplicationController

  #application.html.erbを適用せずに
  #新たに作ったindex.html.erb(footer無し)を適用する
  layout 'index'

  def index
    if logged_in?
      # form_with用
      # index.html.erbに投稿するフォームを設置するから
      # @postにカラのインスタンスを代入しておく
      # form_with(model: @post)として使用する
      @post = current_user.posts.build
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
    end
  end
end
