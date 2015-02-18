##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  set :session_secret, '37b2ed8ce2946a37e3365da36f4649b4447b5e70afbb2fd975ef6e328c1f6771'
  set :protection, :except => :path_traversal
  set :protect_from_csrf, false 
end

# Mounts the core application for this project
Padrino.mount('Todolist::App', :app_file => Padrino.root('app/app.rb')).to('/')
