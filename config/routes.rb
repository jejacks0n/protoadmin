Protoadmin::Engine.routes.draw do

  root to: 'protoadmin/application#dashboard'
  devise_for :admins, {
    path: '',
    skip: [:registrations, :confirmations],
    skip_helpers: true,
    module: :devise
  }

end
