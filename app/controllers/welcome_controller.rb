class WelcomeController < ApplicationController
  def index
    render json: {status: 200, message: 'Coffee Compass API'}
  end
end
