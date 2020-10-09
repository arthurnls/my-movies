class ActorsController < ApplicationController
  def index
    @actors = Actor.includes(:netflix_titles, :movies).order(:name)
  end

  def show
    @actor = Actor.includes(:netflix_titles, :movies).find(params[:id])

    @types = Type.all
    @netflix_type0 = @actor.netflix_titles.where(type: @types[0]).order(:title)
    @netflix_type1 = @actor.netflix_titles.where(type: @types[1]).order(:title)
    @movies = @actor.movies.order(:title)
  end
end
