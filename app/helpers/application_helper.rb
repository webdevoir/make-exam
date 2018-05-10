module ApplicationHelper
		def print_image(url)
		# url = Rails.application.assets.find_asset(url).nil? ? nil : url
		# image_tag url || 'closeIcon.png'
		if url && url.length > 0
		  image_tag url
		else
		  image_tag 'closeIcon.png'
		end
	end
end
