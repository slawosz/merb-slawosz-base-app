# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '200e0d0403ea6a4a9fa210caa586c9d5228be0d3'  # required for cookie session store
  c[:session_id_key] = '_merb-slawosz-startup-app_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  Merb::Mailer.config = {
    :host   => 'poczta.o2.pl',
    :port   => '25',
    :user   => 'nowy_startup',
    :pass   => 'haslo',
    :auth   => :login, # :plain, :login, :cram_md5, the default is no auth
    :domain => 'o2.pl' # the HELO domain provided by the client to the server 
  }
  Merb::Slices::config[:merb_auth_slice_activation][:from_email] = 'nowy_startup@o2.pl'
  Merb::Slices::config[:merb_auth_slice_activation][:activation_host] = 'localhost:4000'

end
