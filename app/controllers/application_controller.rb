require "application_responder"

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  def set_global_search
    @search = Post.ransack(params[:q])
  end
  helper_method :set_global_search

  # some code here
  before_action :set_global_search
end
