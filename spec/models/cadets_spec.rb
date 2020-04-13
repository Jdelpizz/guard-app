require 'rails_helper'

RSpec.describe Cadets, type: :model do

  context 'validation tests' do

    it 'ensures first name presence' do
      cadets = Cadets.new(L_NAME: 'Last', EMAIL: 'testing@citadel.edu').save
      expect(cadets).to eq(false)
    end
    
    it 'ensures last name presence' do
      cadets = Cadets.new(F_NAME: 'First', EMAIL: 'testing@citadel.edu').save
      expect(cadets).to eq(false)
    end

    it 'ensures email name presence' do
      cadets = Cadets.new(F_NAME: 'First', L_NAME: 'Last').save
      expect(cadets).to eq(false)
    end

    it 'ensures CWID name presence' do
      cadets = Cadets.new(L_NAME: 'Last', EMAIL: 'testing@citadel.edu').save
      expect(cadets).to eq(false)
    end

    it 'should save successfully' do
      cadets = Cadets.new(L_NAME: 'Last', EMAIL: 'testing@citadel.edu',F_NAME: 'First', CWID: 10609274, CO_ID: 10, C_STATUS: '4', R_NUM: '3121', P_NUM: '28232123', RANK_ID: 2  ).save
      expect(cadets).to eq(true)
    end
  end

  context 'scope tests' do
  end
end
