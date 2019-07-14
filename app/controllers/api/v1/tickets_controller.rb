class Api::V1::TicketsController < ApplicationController

  def index
    results = Ticket.all_active_tickets
    render json: results
  end

end
