class UsersController < ApplicationController
  before_action :load_user, only: [:show]
  before_action :authentificate_user, only: [:new, :edit, :update, :destroy]
  before_action :its_me, only: [:update]

  def its_me
    redirect_to post_path if User.find(params[:id]) != current_user
  end  

  def index
  end

  def new
  end

  def show
  end

  def load_user
    @user = User.find(params[:id])
  end
end
