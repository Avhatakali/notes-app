class NotesController < ApplicationController

  def index
    auth_token = session[:auth_token]
    @response = HTTParty.get('http://localhost:3000/notes', headers: { 'Authorization' => auth_token })
    @notes = @response.parsed_response
  end

  def edit
    auth_token = session[:auth_token]
    @response = HTTParty.get("http://localhost:3000/notes/#{params["id"]}", headers: { 'Authorization' => auth_token })
    @note = @response.parsed_response
  end

  def create
    auth_token = session[:auth_token]
    @note = HTTParty.post('http://localhost:3000/notes', :headers=> { "Authorization" => auth_token }, body: note_params)
    redirect_to notes_path
  end

  def update
    auth_token = session[:auth_token]
    @response = HTTParty.patch("http://localhost:3000/notes/#{params["id"]}",
        headers: { 'Authorization' => auth_token },
        body: note_param)
    redirect_to notes_path
  end

  def destroy
    auth_token = session[:auth_token]
    @response = HTTParty.delete("http://localhost:3000/notes/#{params["id"]}",
        headers: { 'Authorization' => auth_token })
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note)
          .permit(:content).as_json
  end

  def note_param
    params.permit(:content).as_json
  end
end
