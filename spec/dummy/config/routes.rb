Dummy::Application.routes.draw do

  root to: 'application#welcome'

  mount Protoadmin::Engine => '/admin'

end
