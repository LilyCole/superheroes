Rails.application.routes.draw do

  root to: 'teams#index'

  resources :teams do
    resources :superheroes, :except => [:index]
  end

  resources :superpowers
  
  post '/teams/:team_id/superheroes/:superhero_id/superpower', to: 'superhero_superpowers#create', as: 'superhero_superpowers'
  delete '/teams/:team_id/superheroes/:superhero_id/superpower/:id', to: 'superhero_superpowers#destroy', as: 'destroy_superhero_superpowers'

end
