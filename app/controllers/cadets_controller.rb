class CadetsController < ApplicationController

    def show
        @cadet = Cadets.find(params[:id])
    end

    def index
        @cadets = Cadets.all
    end

end