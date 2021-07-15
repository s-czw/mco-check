require 'rest-client'
require 'json'

class TrackerController < ApplicationController
	def list
		@url = 'http://api.coronatracker.com/v5/analytics/dailyNewStats'
		@response = JSON.parse RestClient.get @url
		puts "response: #{JSON.pretty_generate @response}"
		@response.each do |line|
			if (line["country"] == "Malaysia")
				@cases = line["daily_cases"]
				@deaths = line["daily_deaths"]
				@date = DateTime.parse line["last_updated"]
				break
			end
		end
	end

	def subscribe
		@email = params[:email]
	end
end
