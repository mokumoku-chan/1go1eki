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

  namespace :admins do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :stores, only: [:index, :show, :edit, :update]
  end


  scope module: :users do
    root to: 'homes#top'
    get 'users/mypage' => 'userpages#show', as: 'mypage'
    get 'users/mypage/edit' => 'userpages#edit', as: 'mypage_edit'
    patch 'users/mypage' => 'userpages#update', as: 'mypage_update'
    post 'users/mypage' => 'userpages#create', as: 'mypage_create'
    delete 'users/mypage' => 'userpages#destroy', as: 'destroy_mypage'

    resources :homes, only: [:index]
    resources :stores, only: [:index, :show]
  end


  namespace :stores do
    root to: 'homes#top'
    get '/mypage' => 'userpages#show'
    get '/mypage/edit' => 'userpages#edit'
    patch '/mypage' => 'userpages#update'

    get '/storepage' => 'storepages#show', as: 'storepage'
    get '/storepage/edit' => 'storepages#edit', as: 'storepage_edit'
    patch '/storepage' => 'storepages#update', as: 'storepage_update'
    post '/storepage' => 'storepages#create', as: 'storepage_create'

    resources :info, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  end




end
