ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'tasks'
  map.resources :tasks
  map.connect ':id', :controller => 'tasks', :action => 'show'
end
