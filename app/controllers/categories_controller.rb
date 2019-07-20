# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to    :html, :json, :js

  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def show
    respond_with(@category)
  end

  def create
    @category = current_user.categories.create(category_params)
    respond_with(@category)
  end

  def edit
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :tags, :category_id)
  end
end