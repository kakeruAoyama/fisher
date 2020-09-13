class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id]) #追記
    if params[:search] == nil
      @posts= Post.all.page(params[:page]).per(5)
  elsif params[:search] == ''
      @posts= Post.all.page(params[:page]).per(5)
  else
      #部分検索
      @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%').or(Post.where("fishname LIKE ? ", "%" + params[:search] + "%")).page(params[:page]).per(5)
  end
end
end
