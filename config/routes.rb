Rails.application.routes.draw do
  devise_for :users
  root to: "cocktails#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %i[index show] do
    member do
      post :add_to_favorites
      delete :remove_from_favorites
    end
  end
  get 'cocktails/search_results', to: 'cocktails#search_results', as: 'search_results'
end
