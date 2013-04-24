require 'spec_helper'

feature 'Visitor signs in' do
	scenario 'success' do
		visit new_user_session_path
		fill_in_sign_in_form
		submit_form

		should_see_message_signed_in_successfully
	end

	def fill_in_sign_in_form
		user = FactoryGirl.create(:user, password: 'password')
		fill_in 'user_email', with: user.email
		fill_in 'user_password', with: user.password
	end

	def submit_form
		find('input[type="submit"]').click
	end

	def should_see_message_signed_in_successfully
		page.should have_content(
			t('devise.sessions.signed_in')
		)
	end
end