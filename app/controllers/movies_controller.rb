class MoviesController < ApplicationController
  before_action :set_movies, only: [:show]

  def show; end

  def index
    @movies = Movie.all
  end
end

private

def set_movies
  @movie = Movie.find(params[:id])
end
