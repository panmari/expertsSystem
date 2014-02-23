class RequestsController < ApplicationController

  def create
    request = params[:request]
    r = RequestHandler.new
    if request
      @expert_scores = r.find_expert_for request[:search]
    end

  end
end
