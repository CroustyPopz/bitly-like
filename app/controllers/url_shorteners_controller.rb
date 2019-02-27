class UrlShortenersController < ApplicationController
    def index
        @url_shorteners = UrlShortener.all
    end
    
    def show
        @url_shortener = UrlShortener.find(params[:id])
    end

    def edit
        @url_shortener = UrlShortener.find(params[:id])
    end

    def new
        @url_shortener = UrlShortener
        .new
    end

    def create
        @url_shortener = UrlShortener.new(url_shortener_params)
        @url_shortener.short = UrlShortener.count.to_s(36)
 
        if @url_shortener.save
            redirect_to @url_shortener
        else
            render 'new'
        end
    end

    def update
        @url_shortener = UrlShortener.find(params[:id])
       
        if @url_shortener.update(url_shortener_params)
          redirect_to @url_shortener
        else
          render 'edit'
        end
    end


    def destroy
        @url_shortener = UrlShortener.find(params[:id])
        @url_shortener.destroy
    
        redirect_to url_shorteners_path
    end

    private
        def url_shortener_params
            params.require(:url_shortener).permit(:url)
        end
end
