class Api::V1::Resources::TicketsController < ApplicationController
  before_action :current_user

  def index
    results = Ticket.tickets_by_resource(params["resource_id"].to_i)
    render json: results
  end

  def create
    resource = Resource.find_by(id: params["resource_id"])
    user = User.find_by(id: params["user_id"])
    if resource && user
    ticket = Ticket.create!(
      table_key: resource.id,
      table_name: "Resources",
      user_id: user.id,
      priority: params[:priority],
      status: params[:status],
      frequency_unit: params[:frequency_unit],
      frequency_value: params[:frequency_value],
      notes: params[:notes]
    )
      if ticket.save
        render json: ticket
      end
    else
        render json: {status: "406",
        body: {
          "Error": "Unable to create your ticket. Maybe the resource or the user do not exist."
          }}
    end
  end

  def show
    ticket = Ticket.find(params["ticket_id"].to_i)
    render json: ticket
  end

  def update
    ticket = Ticket.find_by(id: params[:id])
    if ticket
      ticket.update(resource_ticket_params)
      updated_ticket = Ticket.find(params[:id])
      render json: updated_ticket
    else
      render json: {
        "Error": "Resource ticket does not exist."
      }
    end
  end

private
  def resource_ticket_params
    params.permit(:table_key, :table_name, :priority, :notes, :user_id, :frequency_unit, :frequency_value, :active, :status)
  end

end
