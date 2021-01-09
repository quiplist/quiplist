Rails.application.routes.draw do
  root to: 'homepage#index'
  # get '/*path' => 'homepage#index'
  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show, :create, :update, :destroy] do
        get '/find_by_event_code/:event_code', to: 'events#find_by_event_code', on: :collection
        post :upload_brochure, to: 'events#upload_brochure', on: :member
      end
    end
  end
  devise_for :users, controllers: {
        sessions: 'users/sessions'
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
