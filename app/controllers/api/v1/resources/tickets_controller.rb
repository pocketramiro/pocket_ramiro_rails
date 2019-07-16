class Api::V1::Resources::TicketsController < ApplicationController
  def index
    results = Ticket.tickets_by_resource(params["id"].to_i)
    render json: results
  end

  def create
    ticket = Ticket.new(resource_ticket_params)
    if ticket.save
      render json: {status: "201",
      body: {
        "message": "You have successfully created a ticket."
        }}
    else
        render json: {status: "406",
        body: {
          "message": "Unable to create your ticket."
          }}
    end
  end

  def show
    ticket = Ticket.find(params["ticket_id"].to_i)
    render json: ticket
  end

private
  def resource_ticket_params
    params.permit(:table_key, :table_name, :priority, :notes, :user_id, :frequency_unit, :frequency_value, :active)
  end

end
