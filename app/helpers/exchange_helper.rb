module ExchangeHelper
	def get_assignment_button_text(ex)
		if ex.locked?
			"Assigned!"
		elsif (cnt = ex.participations.count) <= 3
			"Waiting for #{3 - cnt} more #{'participant'.pluralize}"
		else
			"Assign!"
		end
	end
end
