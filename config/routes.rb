Rails.application.routes.draw do
  devise_for :stores
  # devise_for :publics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    root to: 'homes#top'
    resources :publics, only: [:index, :show, :edit, :update]
  end


  namespace :publics do
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

end
