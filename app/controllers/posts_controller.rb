class PostsController < ApplicationController

  #application.html.erbを適用せずに
  #新たに作ったindex.html.erb(footer無し)を適用する
  layout 'index'

  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Successfully posted !'
      redirect_to webapp_toppages_url
    else  
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'Posting faild . '
      render 'webapptoppages/index'
    end
  end

  def destroy
    # この@postはcorrect_userメソッドで取得したもの
    # つまりcorrect_userの時点でUserに紐づいた投稿を
    # 取得できていなければこのdestroyメソッドは実行されない
    @post.destroy
    flash[:success] = ' Successfully deleted '
    # redirect_backはアクションが実行されたページに戻る
    # fallback_locationは保険的なもので、戻るべき
    # 場所が見つからない時に、戻る場所を指定するもの。
    redirect_back(fallback_location: webapp_toppages_path)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Content is updated successfully !'
      redirect_to webapp_toppages_url
    else
      flash.now[:danger] = 'Updating post failed . '
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def correct_user
    # 削除しようとしている投稿が本当に
    # 自分の投稿であるか確かめる
    # 他の人の投稿を勝手に消してしまえる設定はNG
    # もし自分のでなければdestroyアクションは実行せずに、
    # webapp_toppagesに戻るようにしている
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to webapp_toppages_url
    end
  end
    
end