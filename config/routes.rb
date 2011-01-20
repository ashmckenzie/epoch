ActionController::Routing::Routes.draw do |map|

  map.resources :converts

  map.root :controller => "converts", :action => "new"

end
