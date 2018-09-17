class Dart < ApplicationRecord
	require 'net/http'
	require 'uri'
	require 'nokogiri'
	require 'open-uri'

	def self.getStopInfo(stopId, direction)
		url = "http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByCodeXML?StationCode=" + stopId
		doc = Nokogiri::XML(open(url).read)
		doc.remove_namespaces!
		trains = Array.new()

		doc.xpath("//objStationData").each do |train|
			tempTrain = Dart.new
			tempTrain.destination = train.xpath('Destination').text.to_s
			# tempTrain.traintype = train.xpath('Traintype').text.to_s
			tempTrain.duetime = train.xpath('Duein').text.to_s
			if train.xpath('Direction').text.to_s == direction
				trains << tempTrain	
			end	
		end
		return trains
	end
end
