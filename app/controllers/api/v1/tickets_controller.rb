class Api::V1::TicketsController < ApplicationController

  def index
    if params[:table] || params[:active]
      table = params[:table].titlecase
      results = Ticket.search(table, params[:active])
    else
    results = Ticket.all_active_tickets
  end
    render json: results
  end

  def show
    ticket = Ticket.find(params["id"].to_i)
    render json: ticket
  end

end
