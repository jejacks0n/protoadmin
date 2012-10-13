Protoadmin::Engine.routes.draw do

  # Dashboard route
  root to: 'protoadmin/application#dashboard'

  # Styleguide route
  match 'styleguide(/:action)' => 'protoadmin/styleguide#show', as: :styleguide

  # Devise routing
  devise_for :admins,
    path: '',
    skip: [:registrations, :confirmations],
    skip_helpers: true,
    module: :devise,
    controllers: {
      sessions: 'protoadmin/devise/sessions',
      passwords: 'protoadmin/devise/passwords',
      #registrations: 'protoadmin/devise/registrations',
    }
  devise_scope :admin do
    resource :registration,
      only: [:edit, :update],
      path: 'profile',
      controller: 'protoadmin/devise/registrations',
      as: :admin_registration
  end

end
