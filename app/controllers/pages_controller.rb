class PagesController < ApplicationController
  # GET /
  def home; end

  # GET /about
  def about; end

  # GET /search/?search_term=user+search+terms
  def search
    @searched_term = params[:search_term]
    @movies = Movie.where(title: @searched_term).order(:title)
    @types = Type.all
    @netflix_titles_type0 = NetflixTitle.where(type: @types[0]).where(title: @searched_term).order(:title)
    @netflix_titles_type1 = NetflixTitle.where(type: @types[1]).where(title: @searched_term).order(:title)
    @total = @movies.count + @netflix_titles_type0.count + @netflix_titles_type1.count
  end
end
