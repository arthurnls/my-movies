class NetflixTitlesController < ApplicationController
  def index
    # @netflix_titles = NetflixTitle.order(:title).group_by(:type)
    @types = Type.all
    @netflix_titles_type0 = NetflixTitle.where(type: @types[0]).order(:title)
    @netflix_titles_type1 = NetflixTitle.where(type: @types[1]).order(:title)

    @total_genres = NetflixTitleGenre.group(:genre_id).distinct.count.count
    @total_actors = NetflixTitleActor.group(:actor_id).distinct.count.count
    @total_directors = NetflixTitleDirector.group(:director_id).distinct.count.count

    @total_users = UserNetflixTitle.group(:user_id).distinct.count.count
  end

  def show
    @netflix_title = NetflixTitle.includes(:users, :genres, :actors, :directors).find(params[:id])
  end
end
