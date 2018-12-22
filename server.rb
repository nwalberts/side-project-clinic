require "sinatra"
require "json"
require "pry" if development? || test?
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'  # bind to all interfaces
set :public_folder, File.join(File.dirname(__FILE__), "public")

require_relative "./models/google_matrix_wrapper.rb"

get "/trips" do

  erb :new
  #For Exceeds Only
  #Use questions.json to pull a random question for your question data
end

get "/gifs" do

  erb :index
end

post "/trips" do
  origin = params[:origin]
  destination = params[:destination]
  @results = GoogleMatrixWrapper.retrieve_trip(origin, destination)
  # binding.pry
  @distance = @results["rows"][0]["elements"][0]["distance"]["text"]
  @duration = @results["rows"][0]["elements"][0]["duration"]["text"]

  erb :new
end
