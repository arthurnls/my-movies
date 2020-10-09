class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:title)
    
    @total_genres = MovieGenre.group(:genre_id).distinct.count.count
    @total_actors = MovieActor.group(:actor_id).distinct.count.count
    @total_directors = MovieDirector.group(:director_id).distinct.count.count

    @total_users = UserMovie.group(:user_id).distinct.count.count
  end

  def show
    @movie = Movie.includes(:users, :genres, :actors, :directors).find(params[:id])
  end
end
