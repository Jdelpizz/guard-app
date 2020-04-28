# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

base_cadets = 
[
    {
        :id => 0,
        :CWID => 11111111,
        :CO_ID => '20',
        :C_STATUS => '4',
        :F_NAME => "Maria", 
        :M_INITIAL => "F",
        :L_NAME => "Contreras", 
        :R_NUM => "3365", 
        :P_NUM => "4073343443",
        :EMAIL => "mcontrer@citadel.edu", 
        :RANK_ID => 7, 
        :monday => "0800", 
        :tuesday => "0900", 
        :wednesday => "1000", 
        :thursday => "1100", 
        :friday => "1200"
    }
#     {:id => 1, :CWID => 10729283, :CO_ID => '20',
#      :C_STATUS => '5', :F_NAME => "Yoon", :M_INITIAL => "",
#      :L_NAME => "Kim", :R_NUM => "3135", :P_NUM => "8393374620",
#      :EMAIL => "ykim3@citadel.edu", :RANK_ID => 3, :monday => "1200", :tuesday => "1300", :wednesday => "0800", :thursday => "0900", :friday => "1000"
#     },
#     {:id => 2, :CWID => 78329301, :CO_ID => '19',
#      :C_STATUS => '3', :F_NAME => "Shiloh", :M_INITIAL => "",
#      :L_NAME => "Smiles", :R_NUM => "4213", :P_NUM => "638742931",
#      :EMAIL => "smiles2@citadel.edu", :RANK_ID => 2, :monday => "0900", :tuesday => "1300", :wednesday => "1400", :thursday => "1500", :friday => "2000"
#     },
#     {:id => 3, :CWID => 78354622, :CO_ID => '14',
#      :C_STATUS => '3', :F_NAME => "Robert", :M_INITIAL => "",
#      :L_NAME => "Roser", :R_NUM => "2321", :P_NUM => "6483923543",
#      :EMAIL => "ykim3@citadel.edu", :RANK_ID => 3, :monday => "", :tuesday => "2100", :wednesday => "2200", :thursday => "0800", :friday => "1200"
#     },
#     {:id => 4, :CWID => 10729283, :CO_ID => '20',
#      :C_STATUS => '5', :F_NAME => "Yoon", :M_INITIAL => "",
#      :L_NAME => "Kim", :R_NUM => "3135", :P_NUM => "8393374620",
#      :EMAIL => "rroser@citadel.edu", :RANK_ID => 4, :monday => "1000", :tuesday => "1200", :wednesday => "0900", :thursday => "0700", :friday => "0500"
    # }
]

base_locations = 
[
    {:LOCA_ID => '0', :LOCA_NAME => "Lesesne Gate"},
    {:LOCA_ID => '1', :LOCA_NAME => "Hagood Gate"},
    {:LOCA_ID => '2', :LOCA_NAME => "First Battalion"},
    {:LOCA_ID => '3', :LOCA_NAME => "Second Battalion"},
    {:LOCA_ID => '4', :LOCA_NAME => "Third Battalion"},
    {:LOCA_ID => '5', :LOCA_NAME => "Fourth Battalion"},
    {:LOCA_ID => '6', :LOCA_NAME => "Fifth Battalion"}
]

base_company = 
[
    {:CO_ID => 0, :LOCA_ID =>2, :CO_NAME => "Alpha"},
    {:CO_ID => 1, :LOCA_ID =>2, :CO_NAME => "Bravo"},
    {:CO_ID => 2, :LOCA_ID =>2, :CO_NAME => "Charlie"},
    {:CO_ID => 3, :LOCA_ID =>2, :CO_NAME => "Delta"},
    {:CO_ID => 4, :LOCA_ID =>3, :CO_NAME => "Echo"},
    {:CO_ID => 5, :LOCA_ID =>3, :CO_NAME => "F-Troop"},
    {:CO_ID => 6, :LOCA_ID =>3, :CO_NAME => "Golf"},
    {:CO_ID => 7, :LOCA_ID =>3, :CO_NAME => "Hotel"},
    {:CO_ID => 8, :LOCA_ID =>4, :CO_NAME => "India"},
    {:CO_ID => 9, :LOCA_ID =>4, :CO_NAME => "Kilo"},
    {:CO_ID => 10, :LOCA_ID =>4, :CO_NAME => "Lima"},
    {:CO_ID => 11, :LOCA_ID =>4, :CO_NAME => "Mike"},
    {:CO_ID => 12, :LOCA_ID =>5, :CO_NAME => "November"},
    {:CO_ID => 13, :LOCA_ID =>5, :CO_NAME => "Oscar"},
    {:CO_ID => 14, :LOCA_ID =>6, :CO_NAME => "Papa"},
    {:CO_ID => 15, :LOCA_ID =>5, :CO_NAME => "Romeo"},
    {:CO_ID => 16, :LOCA_ID =>6, :CO_NAME => "Sierra"},
    {:CO_ID => 17, :LOCA_ID =>5, :CO_NAME => "Tango"},
    {:CO_ID => 18, :LOCA_ID =>6, :CO_NAME => "Victor"},
    {:CO_ID => 19, :LOCA_ID =>6, :CO_NAME => "Palmetto Battery"},
    {:CO_ID => 20, :LOCA_ID =>3, :CO_NAME => "Band"}
]

base_ranks = 
[
    {:RANK_ID => 0, :RANK_NAME => "Private", :BOL_SWORD => false},
    {:RANK_ID => 1, :RANK_NAME => "Corporal", :BOL_SWORD => false},
    {:RANK_ID => 2, :RANK_NAME => "Sergeant", :BOL_SWORD => false},
    {:RANK_ID => 3, :RANK_NAME => "Staff Sergeant", :BOL_SWORD => false},
    {:RANK_ID => 4, :RANK_NAME => "Sergeant First Class", :BOL_SWORD => true},
    {:RANK_ID => 5, :RANK_NAME => "Master Sergeant", :BOL_SWORD => true},
    {:RANK_ID => 6, :RANK_NAME => "First Sergeant", :BOL_SWORD => true},
    {:RANK_ID => 7, :RANK_NAME => "Sergeant Major", :BOL_SWORD => true},
    {:RANK_ID => 8, :RANK_NAME => "Command Sergeant Major", :BOL_SWORD => true},
    {:RANK_ID => 9, :RANK_NAME => "Second Lieutenant", :BOL_SWORD => true},
    {:RANK_ID => 10, :RANK_NAME => "First Lieutenant", :BOL_SWORD => true},
    {:RANK_ID => 11, :RANK_NAME => "Captain", :BOL_SWORD => true},
    {:RANK_ID => 12, :RANK_NAME => "Major", :BOL_SWORD => true},
    {:RANK_ID => 13, :RANK_NAME => "Lieutenant Colonel", :BOL_SWORD => true},
    {:RANK_ID => 14, :RANK_NAME => "Colonel", :BOL_SWORD => true}
]

base_c_statuses = 
[
    {:C_ID => 0, :C_NAME => "Knob"},
    {:C_ID => 1, :C_NAME => "Sophomore"},
    {:C_ID => 2, :C_NAME => "Junior"},
    {:C_ID => 3, :C_NAME => "Senior"}
]

# base_cadets.each do |cadet|
#     Cadets.create!(cadet)
# end
base_locations.each do |location|
    ::Locations.create!(location)
end
base_company.each do |company|
    ::Company.create!(company)
end
base_ranks.each do |rank|
    ::Ranks.create!(rank)
end
base_c_statuses.each do |status|
    ::CStatus.create!(status)
end