module PersonApp
  class PeopleController < ApplicationController

    def index
       @people = Person.all

      # render the HTML
     # content = LAYOUT_HTML_PRE

      render()


      # @people.each do |person|
      #   content += person.to_html
      # end
     # content += LAYOUT_HTML_POST
    end

    def show
      @person = Person.find(params[:id])
      #@person.to_html
      render
      # "In the PeopleController#show with params = #{params.inspect}"
    end

  end
end
