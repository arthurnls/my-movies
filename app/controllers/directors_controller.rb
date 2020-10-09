class DirectorsController < ApplicationController
  def index
    @directors = Director.includes(:netflix_titles, :movies).order(:name)
  end

  def show
    @director = Director.includes(:netflix_titles, :movies).find(params[:id])

    @types = Type.all
    @netflix_type0 = @director.netflix_titles.where(type: @types[0]).order(:title)
    @netflix_type1 = @director.netflix_titles.where(type: @types[1]).order(:title)
    @movies = @director.movies.order(:title)
  end
end
