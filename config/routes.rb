Protoadmin::Engine.routes.draw do

  root to: 'protoadmin/application#dashboard'
  match 'styleguide(/:action)' => 'protoadmin/styleguide#show', as: :styleguide

  devise_for :admins, {
    path: '',
    skip: [:registrations, :confirmations],
    skip_helpers: true,
    module: :devise
  }

end
