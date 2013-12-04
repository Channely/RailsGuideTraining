class PostsController < ApplicationController
  http_basic_authenticate_with name:'hulu', password: 'hulu', except: [:index, :show]
  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :text, :commit))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def create
    @post = Post.new(post_params)
    @post.save
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :commit)
    end
end
