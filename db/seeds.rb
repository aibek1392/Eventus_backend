# Event.destroy_all
# User.destroy_all


events = RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?apikey=r7qtrGxNYlU9gXJwaNwTHLuk6NJQa1RR&size=150'
parsedEvents = JSON.parse(events)
resultingEvents = parsedEvents["_embedded"]["events"]
aibek = User.create(username: "user3", password: "pw3", image: "https://www.pngkey.com/png/detail/115-1150152_default-profile-picture-avatar-png-green.png",)
resultingEvents.each do |event|
    Event.create(category: event["classifications"][0]["genre"]["name"], 
    longitude: event["_embedded"]["venues"][0]["location"]["longitude"].to_f,
    latitude: event["_embedded"]["venues"][0]["location"]["latitude"].to_f,
    location: event["_embedded"]["venues"][0]["state"]["name"],
    zip_code: event["_embedded"]["venues"][0]["postalCode"],
    city: event["_embedded"]["venues"][0]["city"]["name"],
    description: event["_embedded"]["venues"][0]["address"]["line1"],
    end_time: event["dates"]["start"]["dateTime"], 
    start_time: event["dates"]["start"]["localTime"],
    date: event["dates"]["start"]["localDate"],
     name: event["name"],
     image: event["images"][6]["url"], 
     url: event["url"],
     user: aibek )
end


# puts "It's been seeded"


User.create(username: "user1", image: "https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png", password: "pw1")
User.create(username: "user2", image: "https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png", password: "pw2")