Rails.application.routes.draw do

  resources :cocktails do
    resources :doses, only: [ :new, :create]
     collection do # ===> restaurants/....
     get 'ingredients', to: 'cocktail#id'
    end
  end

  resources :doses, only: [:destroy]
end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

