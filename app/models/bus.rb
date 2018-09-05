class Bus < ApplicationRecord
	require 'net/http'
	require 'uri'
	require 'nokogiri'
	require 'open-uri'
	

	def self.getStopInfo(stopId)
		url = "https://data.smartdublin.ie/cgi-bin/rtpi/realtimebusinformation?stopid=" + stopId + "&format=xml"
		doc = Nokogiri::XML(open(url).read)
		doc.remove_namespaces!
		buses = Array.new()

		doc.xpath("///result").each do |bus|
			tempBus = Bus.new
			tempBus.route = bus.xpath('route').text.to_s
			tempBus.destination = bus.xpath('destination').text.to_s
			tempBus.departureduetime = bus.xpath('departureduetime').text.to_s
			buses << tempBus
		end
		return buses
	end
end
