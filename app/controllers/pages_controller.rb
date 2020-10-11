class PagesController < ApplicationController
  # GET /
  def home; end

  # GET /about
  def about; end

  # GET /search/?search_term=user+search+terms
  def search
    @searched_term = params[:search_term]
    if params[:genre][:id].present?
      search_genre_id = params[:genre][:id]
      genre = Genre.find(search_genre_id)
    end

    # if params[:category].blank? or params[:category][:id].blank?
    #     @books_view = Book.all
    # else
    #     @books_view = Book.joins(:subcatagory).joins('catagories on catagories.id = subcatagories.catagory_id').where(catagories: {id: params[:catagory][:id]})
    # end

    @types = Type.all
    if genre.nil?
      @movies = Movie.where("title LIKE ?", "%#{@searched_term}%").order(:title)
      @netflix_titles_type0 = NetflixTitle.where(type: @types[0]).where("title LIKE ?", "%#{@searched_term}%").order(:title)
      @netflix_titles_type1 = NetflixTitle.where(type: @types[1]).where("title LIKE ?", "%#{@searched_term}%").order(:title)
      @total = @movies.count + @netflix_titles_type0.count + @netflix_titles_type1.count
    else
      @searched_genre = genre
      movies_from_genre = Movie.joins(:genres).where(genres: { id: genre.id })
      netflixt_titles_from_genre = NetflixTitle.joins(:genres).where(genres: { id: genre.id })
      @movies = movies_from_genre.where("title LIKE ?", "%#{@searched_term}%").order(:title)
      @netflix_titles_type0 = netflixt_titles_from_genre.where(type: @types[0]).where("title LIKE ?", "%#{@searched_term}%").order(:title)
      @netflix_titles_type1 = netflixt_titles_from_genre.where(type: @types[1]).where("title LIKE ?", "%#{@searched_term}%").order(:title)
      @total = @movies.count + @netflix_titles_type0.count + @netflix_titles_type1.count
    end
  end
end
