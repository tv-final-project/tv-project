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
    @show_quantity = params[:show_quantity]
    erb :index
  end

  post '/shows' do
    @show_quantity = params[:show_quantity]
    erb :shows
  end

  post '/results' do
    @shows_array = []
    params.each do |show_number, show|
      @shows_array << show
    end
    erb :results
  end

end
