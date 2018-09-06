module ApplicationHelper
	def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
	      base_title
	    else
	      page_title + " | " + base_title
	    end
	end

	def hash_to_duration(hash)
		(hash[:weeks]||0)*604_800+(hash[:days]||0)*86_400+(hash[:hours]||0)*3_600+(hash[:minutes]||0)*60+(hash[:seconds]||0) #to_seconds
	end
end
