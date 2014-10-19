class Router
  def initialize
    @routes = {}
  end

  def match(route)
    @routes.update route
  end

  def routes(&block)
    instance_eval(&block)
    p @routes
  end


end


Router.new.routes do
  match "/login" => "sessions#new"
  match "/users" => "users#index"
end
