require './config/environment'
require './app/models/show'
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
    # @shows_array = []
    # params.each do |show|
    #   @shows_array << show
    # end
    my_show = Show.new
    params.each_value do |show|
      my_show.add_to_shows_array(show)
    end
    @shows_array = my_show.shows_array
    @netflix = my_show.netflix_roulette
    @itunes = my_show.itunes_api
    # @hulu = my_show.hulu_api
    # @amazon = my_show.amazon_api
    @google = my_show.google_api
    erb :results
  end

end
