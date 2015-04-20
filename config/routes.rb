Rails.application.routes.draw do

  resources :screens do
    member do
      post :last_requested_at
    end
  end

  get '/display/:id', to: 'display#show', as: :display

  root to: redirect('/screens')

end
