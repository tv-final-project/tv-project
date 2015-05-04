require './config/environment'

class Show < ActiveRecord::Base
  attr_accessor :netflix_hash, :itunes_hash

  def initialize
    @shows_array = []
    @netflix_hash = {}
    @itunes_hash = {}
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
        @netflix_hash[show] = false
      else
        @netflix_hash[show] = true
      end
    end
    return @netflix_hash
  end

  def itunes_api
    @shows_array.each do |show|
      if ITunesSearchAPI.search(:term => show, :country => "US", :media => "tvShow") == []
        @itunes_hash[show] = false
      else
        @itunes_hash[show] = true
      end
    end
    return @itunes_hash
  end
end
