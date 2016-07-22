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
    click_button 'Save'
  end

  def sign_in
    visit root_path
    click_on 'Get Started'
    fill_in 'Email address', with: login_user.email
    fill_in 'Password', with: login_user.password
    click_button 'SIGN IN'
  end

  scenario 'user sign_up' do
    sign_up
  end

  scenario 'login user and create a new prototype', js: true do
    sign_in
    click_on 'New Proto'
    fill_in 'prototype_title', with: prototype.title
    attach_file 'prototype[images_attributes][0][name]', "#{Rails.root}/spec/fixtures/img/sample.jpg", visible: false
    1.upto(3) do |i|
    attach_file "prototype[images_attributes][#{i}][name]", "#{Rails.root}/spec/fixtures/img/sample.jpg", visible: false
    end
    fill_in 'prototype_catch_copy', with: prototype.catch_copy
    fill_in 'prototype_concept', with: prototype.concept
    click_on 'Publish'
    expect(page).to have_content 'Saved prototype successfully'
  end
end
