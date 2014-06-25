# This is the Application class.
 # It has only one method, call, which will accept HTTP Requests
 # And return HTTP Responses.

##STEP 3 of RACK

module PersonApp
  class PeopleService

    # env is the Hash formed by the HTTP Request
    def call(env)

      request = Rack::Request.new(env)
      response = Rack::Response.new
      response_body = ""

      path = request.path_info

      ####VERY simple router, AKA dispatcher
      if request.request_method == 'GET'
        if path == '/people'
          response_body = PersonApp::PeopleController.new.index
        elsif path=~ /\/people\/+\d/
          controller = PersonApp::PeopleController.new
          controller.path_to_params(path)
          response_body = controller.show
        else
          response_body = "No such Route, doofus."
        end
      elsif request.request_method == 'POST'
      elsif request.request_method == 'PUT'
      elsif request.request_method == 'PATCH'
      elsif request.request_method == 'DELETE'
      else
        response_body = "Huh, what. Don't understand the request method. Go away!"
      end


      response.write(response_body)
      # Need this to calc the Content-Length Response header
      response.finish
    end
  end

end
