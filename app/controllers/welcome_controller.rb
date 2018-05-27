class WelcomeController < ApplicationController

	def index
		@variable = current_user
	end
end
