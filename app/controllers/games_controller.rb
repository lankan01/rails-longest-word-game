require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ("A".."Z").to_a.sample }
    return @letters
  end

  def score
    @score = 3
    if !english_world
      @result = 'Sorry - not a word'
    else
      @result = 'Great answer!'
    end
  end

  private

  def english_world
    @answer = params[:word]
    urlpath = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    result = JSON.parse(URI.open(urlpath).read)
    return result["found"]
  end
end
