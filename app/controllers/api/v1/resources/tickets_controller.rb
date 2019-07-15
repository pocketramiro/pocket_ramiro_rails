class Api::V1::Resources::TicketsController < ApplicationController
  def index
    results = Ticket.tickets_by_resource(params["id"].to_i)
    render json: results
  end

  def create
    ticket = Ticket.new(
      table_name: params["table_name"],
      table_key: params["id"].to_i,
      notes: params["notes"],
      user_id: params["user_id"],
      priority: params["priority"].to_i
    )
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

end
