class PostsController < ApplicationController
  before_action :load_post, only: [:show, :edit]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :my_post, only: [:edit, :update, :destroy]

  def my_post
   @user = Post.find(params[:id]).user_id

   redirect_to current_user if @user != current_user.id
  end

  def posts_params
    params.require(:post).permit(:title, :date_of_publication, :header, :body, :file, :user_id)
  end

  def index
    @post = Post.page(params[:page]).per(9)
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]	  
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)  

    @post.user_id = current_user.id

    if @post.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def update 
    @post = Post.find params[:id]

    if @post.update_attributes(posts_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
  end

  def load_post
    @post = Post.find params[:id]
  end

  def after_sign_out_path_for(resource_or_scope)
    posts_path
  end
end
