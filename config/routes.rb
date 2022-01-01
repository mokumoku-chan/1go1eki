Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    root to: 'homes#top'
    resources :publics, only: [:index, :show, :edit, :update]
    resources :stores, only: [:index]
  end


  namespace :publics do
    root to: 'homes#top'
  end


  namespace :stores do
    root to: 'homes#top'
  end


  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :publics, controllers: {
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations'
  }

  devise_for :stores, controllers: {
    sessions: 'stores/sessions',
    passwords: 'stores/passwords',
    registrations: 'stores/registrations'
  }


end
