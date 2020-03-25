class CadetsController < ApplicationController

    def show
        @cadet = Cadets.find(params[:id])
    end

    def index
        @cadets = Cadets.all
    end

    def new

    end

    def create
        @cadet = Cadets.new(params.require(:cadet).permit(:CWID, :CO_ID, :C_STATUS, :F_NAME, :M_INITIAL, :L_NAME, :R_NUM, :P_NUM, :EMAIL, :RANK_ID))
        @cadet.save
        redirect_to cadet_path(@cadet)
    end
end