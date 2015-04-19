require './config/environment'
require 'pry'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
      enable :sessions
    set :session_secret, 'flatironrulz'
  end

  get '/' do
    erb :index
  end

  post '/' do
    @shows_array = Show.all
    @show_quantity = params[:show_quantity]
    @show_name = params[:show_name]
    erb :index
  end

  post '/results' do
    @shows_array = Show.all
    @show_quantity = params[:show_quantity]
    erb :results
  end

end
