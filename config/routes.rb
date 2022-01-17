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


  namespace :users do
    root to: 'homes#top'
    get '/mypage' => 'userpages#show', as: 'mypage'
    get '/mypage/edit' => 'userpages#edit', as: 'mypage_edit'
    patch '/mypage' => 'userpages#update', as: 'mypage_update'
    post '/mypage' => 'userpages#create', as: 'mypage_create'
    delete '/mypage' => 'userpages#destroy', as: 'destroy_mypage'


    resources :homes, only: [:index]
    resources :stores, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
  end


  namespace :stores do
    root to: 'users/homes#top'
    get '/mypage' => 'userpages#show'
    get '/mypage/edit' => 'userpages#edit'
    patch '/mypage' => 'userpages#update'

    get '/storepage' => 'storepages#show', as: 'storepage'
    get '/storepage/edit' => 'storepages#edit', as: 'storepage_edit'
    patch '/storepage' => 'storepages#update', as: 'storepage_update'
    post '/storepage' => 'storepages#create', as: 'storepage_create'

    get '/image/edit' => 'images#edit'
    patch '/image' => 'images#update'
    post '/image' => 'images#create'
    delete '/image' => 'image#destroy'

    resources :info, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    # resource :image, only: [:edit, :create, :destory]

  end




end
