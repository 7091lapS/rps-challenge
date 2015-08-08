require 'sinatra/base'
require_relative 'game'
require_relative 'computer'

class RockPaperScissors < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/game' do
    @visitor = params[:myname]
    redirect to('/') unless (@visitor != "" || @visitor == nil) # is this acceptable, or should it be in the erb?
    session[:myname] = @visitor
    erb :game
  end

  post '/game' do
    @visitor = params[:myname]
    @my_choice = params[:option]
    @computer_move = Computer.new.move
    session[:option] = @my_choice
    p params
    erb :game
  end
  # start the server if ruby file executed directly
  run! if app_file == $0

  set :views, proc { File.join(root, '..', 'views') }
end