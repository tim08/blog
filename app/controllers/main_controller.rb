class MainController < ApplicationController
  before_action :authenticate_user!, :only => :my_posts
  def index
    params[:tag].present? ? @posts = Post.by_tag(params[:tag]).published.paginate(:page => params[:page]) : @posts = Post.published.paginate(:page => params[:page])
  end

  def my_posts
    @posts = current_user.posts.paginate(:page => params[:page])
  end
end
