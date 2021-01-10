Rails.application.routes.draw do
  root to: 'homepage#index'
  # get '/*path' => 'homepage#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:index, :show, :create, :update, :destroy] do
        get '/find_by_event_code/:event_code', to: 'events#find_by_event_code', on: :collection
        post :upload_brochure, to: 'events#upload_brochure', on: :member
      end

      resources :guest_list, only: [:index] do
        post :set_status, on: :collection
        post :batch_approved, on: :collection
        post :batch_denied, on: :collection
        post :set_raffle_status, on: :collection
        post :batch_eligible, on: :collection
        post :batch_not_eligible, on: :collection
      end
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        get :check_for_user, to: 'users#check_for_user', on: :collection
      end
    end
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }

  # scope 'admin' do
  #   resources :events do
  #     resources :guest_lists
  #     resources :raffles
  #     resources :questionnaires
  #   end
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
