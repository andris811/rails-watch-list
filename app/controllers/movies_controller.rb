class MoviesController < ApplicationController
  before_action :set_movies, only: [:show]

  def show; end

  def index
    @movies = Movie.all

    @search = params["search"].present? ? params[:search][:search] : nil
    if @search.present?
      puts "@search present ? #{@search}"
      @movies = Movie.where("title ILIKE ?", "%#{@search}%")
    end
  end
end

private

def set_movies
  @movie = Movie.find(params[:id])
end
