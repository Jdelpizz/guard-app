require 'rails_helper'

RSpec.describe CadetsController, type: :controller do
    before (:each) do
        @test_cadet_attributes = {:id => 99, :CWID => 73829322, :CO_ID => '21',
                                  :C_STATUS => '4', :F_NAME => "Test", :M_INITIAL => "F",
                                  :L_NAME => "Cadet", :R_NUM => "3365", :P_NUM => "7840039274",
                                  :EMAIL => "testC@citadel.edu", :RANK_ID => 7, :monday => "0800", :tuesday => "0900", :wednesday => "1000", :thursday => "1100", :friday => "1200"}
        @test_cadet = Cadets.create(@test_cadet_attributes)
        
    end
  
    describe "DELETE #destroy" do
      it "redirects to the spreadsheet page " do
        @test_cadet.destroy
        redirect_to 'cadets_path'
      end
    end
end