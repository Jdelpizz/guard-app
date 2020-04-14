class CadetsController < ApplicationController
    before_action :set_cadet, only: [:show, :edit, :update, :destroy]
    skip_before_action :has_profile?, only: [:new, :create]
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
        temp_hash = {:CWID => get_cwid(), :CO_ID => get_company_id(), :C_STATUS => get_cadet_status()}
        
        @cadet = Cadets.new(cadet_params.merge(temp_hash))
        if @cadet.save
            flash[:notice] = "Cadet was created successfully."
            redirect_to cadet_path(@cadet)
        else
            render 'new'
        end
    end

    def get_cwid()
        return current_user.CWID
    end
    
    def get_cadet_status()
        return ::CStatus.find_by(C_NAME: cadet_params[:C_STATUS]).C_ID
    end
    def get_company_id()
        return ::Company.find_by(CO_NAME: cadet_params[:CO_ID]).CO_ID
    end
    def get_rank()
        return ::Ranks.find_by(RANK_NAME: cadet_params[:RANK_ID]).RANK_ID
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
        @cadet.destroy
        redirect_to cadets_path
    end

    private 
    
    def set_cadet
        @cadet = Cadets.find(params[:id])
    end

    def cadet_params
        params.require(:cadet).permit(:CWID, :CO_ID, :C_STATUS, :F_NAME, :M_INITIAL, :L_NAME, :R_NUM, :P_NUM, :EMAIL, :RANK_ID, :monday, :tuesday, :wednesday, :thursday, :friday)
    end
end