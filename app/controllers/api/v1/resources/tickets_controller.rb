class Api::V1::Resources::TicketsController < ApplicationController
  def index
    results = Ticket.tickets_by_resource(params["id"].to_i)
    render json: results
  end

end
