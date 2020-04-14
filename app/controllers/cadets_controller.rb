class CadetsController < ApplicationController
    before_action :set_cadet, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @cadets = Cadets.all
    end

    def new
        @cadet = Cadets.new
    end

    def edit
    end

    def create
        @cadet = Cadets.new(cadet_params)
        if @cadet.save
            flash[:notice] = "Cadet was created successfully."
            redirect_to cadet_path(@cadet)
        else
            render 'new'
        end
    end

    def update
        if @cadet.update(cadets_params)
            flash[:notice] = "Cadet was updated successfully"
            redirect_to cadet_path(@cadet)
        else
            render 'edit'
        end
    end

    def destroy
        @cadet = Cadets.find(params[:id])
        @cadet.destroy
        flash[:notice] = "Cadet was successfully deleted."
        redirect_to cadets_path
    end

    private 
    
    def set_cadet
        @cadet = Cadets.find(params[:id])
    end

    def cadet_params
        params.require(:cadet).permit(:CWID, :CO_ID, :C_STATUS, :F_NAME, :M_INITIAL, :L_NAME, :R_NUM, :P_NUM, :EMAIL, :RANK_ID, :monday, :tuesday, :wednesday, :thursday, :friday)
    end

    def cadets_params
        params.require(:cadets).permit(:CWID, :CO_ID, :C_STATUS, :F_NAME, :M_INITIAL, :L_NAME, :R_NUM, :P_NUM, :EMAIL, :RANK_ID, :monday, :tuesday, :wednesday, :thursday, :friday)
    end
end