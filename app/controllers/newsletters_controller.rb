# frozen_string_literal: true

class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:destroy]

  def create
    newsletter = Newsletter.find_or_create_by(newsletter_params)
    redirect_to root_path, notice: 'Você se cadastrou com sucesso.'
  end

  def destroy
    @newsletter.cancel
    redirect_to root_path, notice: 'Você cancelou a newsletter com sucesso.'
  end

  private

    def set_newsletter
      @newsletter = Newsletter.find_by_token(params[:token])
    end

    def newsletter_params
      params.require(:newsletter).permit(:name, :email)
    end
end