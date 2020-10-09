class TypesController < ApplicationController
  def index
    @types = Type.includes(:netflix_titles).order(:name)
  end

  def show
    @type = Type.includes(:netflix_titles).find(params[:id])
  end
end
