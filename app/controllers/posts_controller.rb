# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  respond_to    :html, :json, :js

  def index
    @newsletter = Newsletter.new
    @search = Post.ransack(params[:q])
    @posts = @search.result(distinct: true).page(params[:page]).per(12)
    respond_with(@posts)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def create
    @post = current_user.posts.create(post_params)
    respond_with(@post)
  end

  def show
    @search = Post.ransack(params[:q])
    respond_with(@post)
  end

  def edit
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post)
      .permit(:title, :description, :content, :published, :tags, :category_id)
  end
end