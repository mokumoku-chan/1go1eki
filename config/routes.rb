Rails.application.routes.draw do


  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :stores, controllers: {
    sessions: 'stores/sessions',
    passwords: 'stores/passwords',
    registrations: 'stores/registrations'
  }



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

  namespace :admins do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :stores, only: [:index, :show, :edit, :update]
  end


  namespace :users do
    root to: 'homes#top'
    get '/mypage' => 'userpages#show', as: 'mypage'
    get '/mypage/edit' => 'userpages#edit', as: 'mypage_edit'
    patch '/mypage' => 'userpages#update', as: 'mypage_update'
    post '/mypage' => 'userpages#create', as: 'mypage_create'
    delete '/mypage' => 'userpages#destroy', as: 'destroy_mypage'
    get 'userpages/unsubscribe' => 'userpages#unsubscribe', as: 'confirm_unsubscribe'
    patch 'userpages/withdraw' => 'userpages#withdraw', as: 'withdraw_user'
    put 'userpages/withdraw' => 'userpages#withdraw'


    resources :storepages, only: [:show, :create]
    resources :reviews, only: [:index, :show]
    resources :stores, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
  end


  namespace :stores do
    root to: 'homes#top'
    get '/mypage' => 'userpages#show'
    get '/mypage/edit' => 'userpages#edit'
    patch '/mypage' => 'userpages#update'

    resources :info, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:index]
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
    resource :image
    resource :storepage, only: [:show, :edit, :update, :create, :destroy]


  end




end
