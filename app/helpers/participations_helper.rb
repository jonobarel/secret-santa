module ParticipationsHelper
	def get_label_and_status(p)
		if (p.get_giftee_secret_name.nil?)
			return "No Giftee assigned yet", true
		end
		return "Gift for #{p.get_giftee_secret_name}", false
	end
end
