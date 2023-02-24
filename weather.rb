require "http"

while true
  puts "WEATHER APP"
  puts "-----------------------------"
  puts "Would you like to continue? (Yes/No)"
  answer = gets.chomp
  if answer.downcase == "yes"
    #get user input
    puts "City"
    city = gets.chomp
    puts "Celcius or Farenheit?"
    temp_units = gets.chomp

    if temp_units.downcase == "celcius"
      units = "metric"
    elsif temp_units.downcase == "farenheit"
      units = "imperial"
    end

    puts "Today or 5-day?"
    time = gets.chomp
    if time == "today"
      # display current weather data
      response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=#{units}")
      data = response.parse(:json)
      temp = data["main"]["temp"]
      description = data["weather"][0]["description"]
      puts "Description: #{description}"
      puts "Temperature: #{temp}"
      sleep(5)
    elsif time == "5-day"
      #display 5 day-forecast
      response = HTTP.get("http://api.openweathermap.org/data/2.5/forecast?q=tampa&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")
      pp response.parse(:json)
    end
  elsif answer.downcase == "no"
    puts "Goodbye!"
    break
  end
end
