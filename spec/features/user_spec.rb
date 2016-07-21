require 'rails_helper'

RSpec.feature 'user', type: :feature do
  given(:user) { build(:user) }
  given(:login_user) { create(:user) }
  given(:prototype) { build(:prototype, :with_sub_images) }

  def sign_up
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    fill_in 'user_name', with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    fill_in 'user_member', with: user.member
    fill_in 'user_profile', with: user.profile
    fill_in 'user_work', with: user.work
    click_button 'save'
  end

  def sign_in
    visit root_path
    click_on 'Get Started'
    fill_in 'Email address', with: login_user.email
    fill_in 'Password', with: login_user.password
    click_button 'Sign in'
  end

  scenario 'user sign_up' do
    sign_up
  end

  scenario 'login user and create a new prototype', js: true do
    sign_up
    logout(:user)
    sign_in
    click_on 'New Proto'
    fill_in 'prototype_title', with: prototype.title
    attach_file 'prototype[images_attributes][0][name]', "#{Rails.root}/spec/fixtures/sample.jpg"
    1.upto(3) do |i|
    attach_file "prototype[images_attributes][#{i}][name]", "#{Rails.root}/spec/fixtures/sample.jpg"
    end
    fill_in 'prototype_catch_copy', with: prototype.catch_copy
    fill_in 'prototype_concept', with: prototype.concept
    click_on 'Publish'
    expect(page).to have_content 'Saved prototype successfully'
  end
end
