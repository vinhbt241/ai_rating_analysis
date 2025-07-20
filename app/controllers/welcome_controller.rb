class WelcomeController < ApplicationController
  def index
    @payloads = Payload.order(created_at: :desc).analyzed.take(5)
  end
end
