class Api::V1::Resources::NotesController < ApplicationController
  def index
    notes = Note.notes_by_resource(params["id"].to_i)
    render json: notes
  end
end
