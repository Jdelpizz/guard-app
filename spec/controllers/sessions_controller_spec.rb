require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    describe '#logout' do        
        context "User is logged in" do
            it "Should log them out" do
                session[:user_id] = 0
                controller.logout()
                expect(session[:user_id]).to eq(nil)
            end
        end

        context "User is not logged in" do
            it "Should log them out" do
                session[:user_id] = nil
                controller.logout()
                expect(session[:user_id]).to eq(nil)
            end
        end
    end
end