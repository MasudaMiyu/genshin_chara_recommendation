Rails.application.routes.draw do
  root 'games#new'
  resources :games, only: %i[new create] do
    member do
      get :give_up
      get :result
    end
    resources :progresses, only: %i[new create]
  end
  get 'user_policy', to: 'static_pages#user_policy'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'inquiry', to: 'static_pages#inquiry'
end
