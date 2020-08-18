require 'test_helper'

class UserSignUp < ActionDispatch::IntegrationTest
	def setup
		@user = User.create!(
			username: 'admin',
			email: 'admin@admin.admin',
			password: 'adminuser'
		)
	end

	test 'Users can be created' do
		u = nil
		assert_difference('User.count', 1) do
			u = User.create!(
				username: 'example',
				email: 'example@example.example',
				password: 'exampleuser'
			)
		end
	end

	test 'Admin users can be created' do
		u = nil
		assert_difference('User.count', 1) do
			u = User.create!(
				username: 'example',
				email: 'example@example.example',
				password: 'exampleuser',
				admin: true
			)
		end

		assert u.admin?
	end
end
