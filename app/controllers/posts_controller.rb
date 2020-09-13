class PostsController < ApplicationController
    before_action :authenticate_user!
    def index
        if params[:search] == nil
            @posts= Post.all.order(id: "desc").page(params[:page]).per(5)
        elsif params[:search] == ''
            @posts= Post.all.order(id: "desc").page(params[:page]).per(5)
        else
            #部分検索
            @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%').or(Post.where("fishname LIKE ? ", "%" + params[:search] + "%")).or(Post.where("basyo LIKE ? ", "%" + params[:search] + "%")).page(params[:page]).per(5)
        end
        @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
        @fishname = Post.select(:fishname).distinct
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def rank
        @fish = Post.where(fishname:params[:name]).order(size: :desc)
        @fishname = params[:name]
    end
    
    def show
        @post = Post.find(params[:id])
        @like = Like.new
        @comments = @post.comments
        @comment = @post.comments.build
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to :action => "show", :id => @post.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        Post.find(params[:id]).destroy
        redirect_to action: :index
    end

    private
    def post_params
        params.require(:post).permit(:body,:image,:fishname,:latitude,:longitude,:size,:name,:postcode, :prefecture_name, :address_city, :address_street, :address_building,:date,:basyo)
    end
end
