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
    @shows_array = params[:shows_array]
    @show_quantity = params[:show_quantity]
    erb :index
  end

  post '/shows' do
    @shows_array = params[:shows_array]
    @show_quantity = params[:show_quantity]
    @shows_name = params[:show_name]
    erb :shows
  end

  post '/results' do
    erb :results.erb
  end

end
