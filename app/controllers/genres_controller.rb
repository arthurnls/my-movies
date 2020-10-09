class GenresController < ApplicationController
  def index
    @genres = Genre.includes(:netflix_titles, :movies).order(:name)
  end

  def show
    @genre = Genre.includes(:netflix_titles, :movies).find(params[:id])

    @types = Type.all
    @netflix_type0 = @genre.netflix_titles.where(type: @types[0]).order(:title)
    @netflix_type1 = @genre.netflix_titles.where(type: @types[1]).order(:title)
    @movies = @genre.movies.order(:title)
  end
end
