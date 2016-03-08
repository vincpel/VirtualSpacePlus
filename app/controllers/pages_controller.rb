class PagesController < ApplicationController

    def home
      @railsRoutes =`rake routes`
    end

    def help
    end

    def about
    end

    def contact
    end

end
