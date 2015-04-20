Rails.application.routes.draw do

  resources :screens

  get '/:id', to: 'display#show', as: :display

  root to: redirect('/screens')

end
