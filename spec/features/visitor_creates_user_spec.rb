require 'spec_helper'

feature 'Visitor creates User' do
  scenario 'success' do
    visit root_path
    click_on 'Sign Up'
    fill_in_sign_up_form
    submit_form

    should_see_message_visitor_created_user
  end

  def fill_in_sign_up_form
    user = FactoryGirl.build(:user)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
  end

  def submit_form
    find('input[type="submit"]').click
  end

  def should_see_message_visitor_created_user
    page.should have_content(
      'Welcome! You have signed up successfully.'
    )
  end
end
