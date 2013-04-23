JlReader::Application.routes.draw do
  devise_for :users

  root to: 'pages#landing'
end
