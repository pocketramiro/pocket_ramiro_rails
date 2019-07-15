class Api::V1::Resources::NotesController < ApplicationController
  def index
    notes = Note.notes_by_resource(params["id"].to_i)
    render json: notes
  end

  def show
    note = Note.find(params["note_id"])
    render json: note
  end

  def create
    note = Note.create(notes_params)
    if note.save
      render json: note
    else
      render json: {
        "Error": "Note could not be created."
      }
    end
  end

  private

    def notes_params
      params.permit(:id, :user_id, :table_key, :table_name, :content, :created_at, :updated_at)
    end
end
