response = HTTParty.get('https://www.govtrack.us/api/v2/bill?congress=115&order_by=-current_status_date&limit=3')
bills = JSON.parse(response.body)

bills['objects'].each do |bill|
  page = Nokogiri::HTML(open("#{bill['link']}/text"))
  Bill.create(name: "#{bill['display_number']}", date:"#{bill['introduced_date']}", sponsor: "#{bill['sponsor']['firstname']} #{bill['sponsor']['lastname']}, #{bill['sponsor_role']['description']}", current_status:"#{bill['current_status_description']}", content: "#{page.css('section.section')}")
end


User.create(username: "tom", password: "b")
User.create(username: "goo", password: "b")
User.create(username: "bob", password: "b")
User.create(username: "bill", password: "b")
User.create(username: "jon", password: "b")
User.create(username: "billy", password: "b")
User.create(username: "timmy", password: "b")
User.create(username: "kyle", password: "b")
User.create(username: "oreo", password: "b")

50.times do
  Comment.create(user_id: rand(1..9), bill_id: rand(1..3), content: "This is a comments text.")
end

