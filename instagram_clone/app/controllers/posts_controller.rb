class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @post = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
      flash[:success]= "Success"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_message
      rendirect_ro new_post_path
    end
  end

  private
  def permit_post
    params.permit(:post).permit(:image,:description)
  end
end
