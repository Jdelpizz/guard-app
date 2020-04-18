# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



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

base_cadets.each do |cadet|
    Cadets.create!(cadet)
end
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