Protoadmin::Engine.routes.draw do

  # Dashboard route
  root to: 'protoadmin/dashboard#index'

  # Styleguide route
  match 'styleguide(/:action)' => 'protoadmin/styleguide#show', as: :styleguide

  # Devise routing
  devise_for Protoadmin.configuration.devise_model.to_s.pluralize.to_sym,
    path: '',
    skip: [:registrations, :confirmations],
    skip_helpers: true,
    module: :devise,
    controllers: {
      sessions: 'protoadmin/devise/sessions',
      passwords: 'protoadmin/devise/passwords',
      #registrations: 'protoadmin/devise/registrations',
    }
  devise_scope Protoadmin.configuration.devise_model do
    resource :registration,
      only: [:edit, :update],
      path: 'profile',
      controller: 'protoadmin/devise/registrations',
      as: :registration
  end

end
