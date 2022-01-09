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

    resources :homes, only: [:index]
  end


  namespace :stores do
    root to: 'homes#top'
    get '/mypage' => 'userpages#show', as: 'mypage'
    get '/mypage/edit' => 'userpages#edit', as: 'mypage_edit'
    patch '/mypage' => 'userpages#update', as: 'mypage_update'

  end




end
