# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

base_cadets = [
    {:id => 1, :CWID => 10621790, :CO_ID => '21',
     :C_STATUS => '4', :F_NAME => "Maria", :M_INITIAL => "F",
     :L_NAME => "Contreras", :R_NUM => "3365", :P_NUM => "4073343443",
     :EMAIL => "mcontrer@citadel.edu", :RANK_ID => 7, :monday => "0800", :tuesday => "0900", :wednesday => "1000", :thursday => "1100", :friday => "1200"
    },
    {:id => 2, :CWID => 10729283, :CO_ID => '20',
     :C_STATUS => '5', :F_NAME => "Yoon", :M_INITIAL => "",
     :L_NAME => "Kim", :R_NUM => "3135", :P_NUM => "8393374620",
     :EMAIL => "ykim3@citadel.edu", :RANK_ID => 3, :monday => "1200", :tuesday => "1300", :wednesday => "0800", :thursday => "0900", :friday => "1000"
    },
    {:id => 3, :CWID => 78329301, :CO_ID => '19',
     :C_STATUS => '3', :F_NAME => "Shiloh", :M_INITIAL => "",
     :L_NAME => "Smiles", :R_NUM => "4213", :P_NUM => "638742931",
     :EMAIL => "smiles2@citadel.edu", :RANK_ID => 2, :monday => "0900", :tuesday => "1300", :wednesday => "1400", :thursday => "1500", :friday => "2000"
    },
    {:id => 4, :CWID => 78354622, :CO_ID => '14',
     :C_STATUS => '3', :F_NAME => "Robert", :M_INITIAL => "",
     :L_NAME => "Roser", :R_NUM => "2321", :P_NUM => "6483923543",
     :EMAIL => "ykim3@citadel.edu", :RANK_ID => 3, :monday => "", :tuesday => "2100", :wednesday => "2200", :thursday => "0800", :friday => "1200"
    },
    {:id => 5, :CWID => 10729283, :CO_ID => '20',
     :C_STATUS => '5', :F_NAME => "Yoon", :M_INITIAL => "",
     :L_NAME => "Kim", :R_NUM => "3135", :P_NUM => "8393374620",
     :EMAIL => "rroser@citadel.edu", :RANK_ID => 4, :monday => "1000", :tuesday => "1200", :wednesday => "0900", :thursday => "0700", :friday => "0500"
    }
]

base_cadets.each do |cadet|
 Cadets.create!(cadet)
end