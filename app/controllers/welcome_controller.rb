class WelcomeController < ApplicationController
  def index
    @payload = Payload.new
  end
end
