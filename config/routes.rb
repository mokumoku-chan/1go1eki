Rails.application.routes.draw do
  devise_for :stores
  devise_for :admins, module: "admins"
  devise_for :publics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    get 'top' => 'homes#top', as: 'top'
    resources :publics, only: [:index, :show, :edit, :update]
  end


end
