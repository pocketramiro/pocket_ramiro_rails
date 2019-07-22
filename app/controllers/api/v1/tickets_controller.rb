class Api::V1::TicketsController < ApplicationController

  def index
    if params[:table] || params[:active]
      table = params[:table].titlecase
      results = Ticket.search(table, params[:active])
    else
    # results = Ticket.all_active_tickets
  end
    ticket = Ticket.all
    render json: TicketSerializer.new(ticket, {include: [:user]})
  end

  def show
    ticket = Ticket.find(params["id"].to_i)
    render json: TicketSerializer.new(ticket, {include: [:user]})
  end

end
