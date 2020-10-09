Rails.application.routes.draw do
  root to: "users#index"

  get "about", to: "pages#about"

  resources "users", only: %i[index show]
  resources "netflix_titles", only: %i[index show]
  resources "movies", only: %i[index show]

  resources "actors", only: %i[index show]
  resources "directors", only: %i[index show]
  resources "genres", only: %i[index show]
  resources "types", only: %i[index show]
end
