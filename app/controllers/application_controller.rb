class ApplicationController < ActionController::API
    after_action :set_cors_headers

  private

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = request.headers['Origin']
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = 'Authorization, Content-Type'
  end
end
