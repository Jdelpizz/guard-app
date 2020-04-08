Then(/^the cwid of "(.*?)" should be "(.*?)"$/) do |lName, cwid|
     cadet = Cadets.find(0)
     cadet.L_NAME == lName
     cadet.CWID == cwid
end