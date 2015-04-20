Rails.application.routes.draw do

  resources :screens

  root to: redirect('/screens')

end
