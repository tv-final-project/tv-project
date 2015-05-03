require './config/environment'

class Show < ActiveRecord::Base
  attr_accessor :netflix

  def initialize
    @shows_array = []
    @netflix = false
  end

  def shows_array
    @shows_array
  end

  def add_to_shows_array(show)
    @shows_array << show
  end

  def netflix_roulette
    @shows_array.each do |show|
      if NetflixRoulette.get_media_poster("#{show}") == "Unable to locate data"
        @netflix = false
      else
        @netflix = true
      end
    end
  end
end