class UsersController < ApplicationController
  def index
    @users = User.includes(:netflix_titles, :movies).order(:name)
  end

  def show
    @user = User.includes(:netflix_titles, :movies).find(params[:id])
    @user_first_name = @user.name.partition(" ").first

    @types = Type.all
    @netflix_type0 = @user.netflix_titles.where(type: @types[0]).order(:title)
    @netflix_type1 = @user.netflix_titles.where(type: @types[1]).order(:title)
    @movies = @user.movies.order(:title)
  end
end
