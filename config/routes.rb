Rails.application.routes.draw do
  root to: 'homepage#index'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  scope 'admin' do
    resources :events do
      resources :guest_lists
      resources :raffles
      resources :questionnaires
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
