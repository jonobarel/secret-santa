module UsersHelper
	#return gravatar for user
	def gravatar_for(user,options = { size: 80 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
    	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

	def get_pronoun_for_user_page(user)
		if (user == current_user)
			"My"
		else
			"#{user.name}'s"
		end
	end

end
