# Ruby Uno Client

require 'json'
require 'rest-client'

class UnoClient
	attr_reader :name

	def initialize name
		@name = name
	end

	def join_game
		response = RestClient.post 'http://localhost:4567/join', :data => {name: @name}.to_json, :accpet => :json
		puts JSON.parse(response, :symbolize_names => true)
	end

	def get_cards
		response = RestClient.get 'http://localhost:4567/cards', {:params => {:name => @name}}
		puts response
	end

	def deal
		response = RestClient.post 'http://localhost:4567/deal', :data =>{}.to_json, :accpet => :json
		puts response
	end

end 