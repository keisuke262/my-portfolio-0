# frozen_string_literal: true


class UsersController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :show, :edit, :followings, :followers]
  before_action :require_user_logged_in, only:[:index, :show, :edit, :favoritemicroposts]
 #Lapplication.html.erbを適用せずに
 #新たに作ったindex.html.erb(navとfooter無し)を適用する
 layout 'index'


  def index
    # ページネーションを適用させるためにpage(params[:page])をつけている
    @users = User.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page])
    counts(@user)
    if logged_in?
      # form_with用
      # index.html.erbに投稿するフォームを設置するから
      # @postにカラのインスタンスを代入しておく
      # form_with(model: @post)として使用する
      @post = current_user.posts.build
    end
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Registered user.'
      redirect_to webapp_toppages_url
    else
      flash.now[:danger] = 'Failed to register user.'
      render :new
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'Content is successfully updated !'
      redirect_to user_url
    else
      flash.now[:danger] = 'Updating content failed . '
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
    if logged_in?
      # form_with用
      # index.html.erbに投稿するフォームを設置するから
      # @postにカラのインスタンスを代入しておく
      # form_with(model: @post)として使用する
      @post = current_user.posts.build
    end
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
    if logged_in?
      # form_with用
      # index.html.erbに投稿するフォームを設置するから
      # @postにカラのインスタンスを代入しておく
      # form_with(model: @post)として使用する
      @post = current_user.posts.build
    end
  end

  def favoriteposts 
    @user = User.find(params[:id])
    @favoriteposts = @user.favoriteposts.page(params[:page])
    counts(@user)
    if logged_in?
      # form_with用
      # index.html.erbに投稿するフォームを設置するから
      # @postにカラのインスタンスを代入しておく
      # form_with(model: @post)として使用する
      @post = current_user.posts.build
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :goal, :achieve, :password, :password_confirmation, :image)
  end
end
