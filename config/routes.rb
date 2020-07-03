Rails.application.routes.draw do  
  # load route function
  def draw(routes_name)
    instance_eval(
      File.read(
        Rails.root.join("config", "routes", "#{routes_name}.rb")
      )
    )
  end

  draw :users
  
  root to:'welcome#index'
end
