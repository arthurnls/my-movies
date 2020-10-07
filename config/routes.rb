Rails.application.routes.draw do
  root to: "pages#about"

  get "about", to: "pages#about"
end
