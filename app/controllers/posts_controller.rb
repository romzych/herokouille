class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_create)

    if @post.save 
      redirect_to post_path(@post.id)
    else
      puts "="*90
          @post.errors.full_messages
      puts "="*90

    end
  end

  def edit
    @post = Post.find(params[:id])    
  end

  def update
    @post = Post.find(params[:id])

    @post.update(params_create)

    redirect_to post_path(@post.id)
  
  end

  protected
  def params_create
    params.require(:post).permit(:name, :body)
  end


end
