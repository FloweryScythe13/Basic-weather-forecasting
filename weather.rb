require 'yahoo_weatherman'

puts "Location: "
l = gets


def find_location(z) 
	client = Weatherman::Client.new
	client.lookup_by_location("#{z}") #Important future note to self - when calling variables in a string like this, 
							# you MUST use double quotes, not single quotes. 
end	

def show_weather(currloc)
	place = find_location(currloc)
	puts "It is #{place.condition['text']} in #{place.location['city']} today."
	puts place.forecasts
	return place.forecasts
end

def show_forecast(fc)
	day = ""
	today = Time.now.strftime('%w').to_i
	tomorrow = today + 1
	fc.each do
		
		|fc| if(fc["date"].strftime('%w').to_i == today) 
			day = "Today"
		elsif(fc["date"].strftime('%w').to_i == tomorrow) 
			day = "Tomorrow"
		else 
			day = fc["day"]
		end
		puts "#{day} is going to be #{fc["text"].downcase} with a low of #{fc["low"]} and a high of #{fc["high"]} degrees Celsius."
		 
	end
end

loc = show_weather(l)
show_forecast(loc)