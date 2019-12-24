require "sinatra"
require "json"
require "pry" if development? || test?
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'  # bind to all interfaces
set :public_folder, File.join(File.dirname(__FILE__), "public")

require_relative "./models/google_matrix_wrapper.rb"

get "/gifs" do
  gifs_object_with_data = GifsWrappe.retrieve_gifs
  @gifs_data = gifs_object_with_data

  erb :index
end
