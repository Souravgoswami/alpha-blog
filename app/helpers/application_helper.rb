module ApplicationHelper
	def active?(path)
		current_page?(path) ? 'active' : ''
	end

	def text_limit(text, n = 100)
		text.to_s.then { |x| x.length > n ? x[0..n] + '...' : x  }
	end
end
