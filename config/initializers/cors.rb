# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# enable this so other websites that is not postman the ability to ask for api info or allow other websites to use ur api
 Rails.application.config.middleware.insert_before 0, Rack::Cors do
   allow do
     origins '*' # change this from example.com to * 

     resource '*',
       headers: :any,
       methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
 end
