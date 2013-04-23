require 'spec_helper'

feature 'Visitor creates User' do
  scenario 'success' do
    visit root_path
    click_on 'Sign Up'
    fill_in_sign_up_form
    submit_form
    should_be_signed_in
  end
end
