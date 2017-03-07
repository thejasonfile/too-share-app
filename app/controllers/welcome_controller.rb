class WelcomeController < ApplicationController
  skip_before_action :require_login
  def index
  end
    def iframe_action
    response.headers.delete "X-Frame-Options"
    render_something
  end
end
