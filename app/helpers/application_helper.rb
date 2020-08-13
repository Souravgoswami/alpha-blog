module ApplicationHelper
	require 'digest'

	def active?(path)
		current_page?(path) ? 'active' : ''
	end

	def text_limit(text, n = 100)
		text.to_s.then { |x| x.length > n ? x[0..n] + '...' : x  }
	end

	def gravatar_for(user, options = { size: 80 })
		size = options[:size].to_i
		hash = Digest::MD5.hexdigest(user.email.downcase)
		image_tag(
			"https://www.gravatar.com/avatar/#{hash}?s=#{size}&d=identicon",
			alt: 'User Image',
			class: 'rounded-circle mx-auto d-block shadow-sm'
		)
	end
end
