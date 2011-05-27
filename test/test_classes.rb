Qwerly.key '7kdezw9gstcgusj8ur5twfna'

res = Qwerly.facebook 'colinyoung10'
case res.status
when Qwerly::ResponseDeveloperInactive
when Qwerly::ResponseOK
when Qwerly::ResponseWait
end

puts res.to_yaml