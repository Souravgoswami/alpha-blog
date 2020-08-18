require 'test_helper'

class UserSignUp::ActionDispatch::IntegrationTest
	def setup
		@user = User.create!(
			username: 'admin'
			email: 'admin@admin.admin',
			password: 'adminuser',
		)
	end

	test 'Users can be added by admin users' do

	end
end
