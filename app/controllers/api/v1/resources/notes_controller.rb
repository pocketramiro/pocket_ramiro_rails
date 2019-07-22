class Api::V1::Resources::NotesController < ApplicationController
  def index
    notes = Note.notes_by_resource(params["resource_id"].to_i)
    render json: NoteSerializer.new(notes, {include: [:user]})
  end

  def show
    note = Note.find(params["id"])
    render json: NoteSerializer.new(note, {include: [:user]})
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

  def update
    note = Note.find_by(id: params[:id])

    if note
      note.update(notes_params)
      updated_note = Note.find(params[:id])
      render json: updated_note
    else
      render json: {
        "Error": "Note does not exist in database."
      }
    end

  end

  private

    def notes_params
      params.permit(:id, :user_id, :table_key, :table_name, :content, :created_at, :updated_at)
    end
end
