class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with=> :error_render_method

  def error_render_method
    respond_to do |format|
            format.html { render file: "public/404.html"}
            format.json { render json: @book.errors, status: :not_found }
    end
    true
  end

end
