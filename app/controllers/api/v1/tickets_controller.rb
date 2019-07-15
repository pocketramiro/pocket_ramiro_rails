class Api::V1::TicketsController < ApplicationController

  def index
    results = Ticket.all_active_tickets
    render json: results
  end

  def show
    ticket = Ticket.find(params["id"].to_i)
    render json: ticket
  end

end
