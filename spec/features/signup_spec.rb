require 'rails_helper'

feature 'Signing up' do
  scenario 'User can sign up with valid info' do

    visit root_path
    click_on "Users"
    click_on "Sign Up"
    fill_in :user_first_name, with: 'New'
    fill_in :user_last_name, with: "Signup"
    fill_in :user_email, with: "new@signup.com"
    fill_in :user_password, with: "signuppw"
    fill_in :user_password_confirmation, with: "signuppw"
    click_on "signup-user-action"

    expect(page).to have_content("New Signup")
    expect(page).to have_content("Sign Out")
  end

  scenario 'User gets error message when first name is left blank' do

    visit root_path
    click_on "Users"
    click_on "Sign Up"
    fill_in :user_last_name, with: "Signup"
    fill_in :user_email, with: "new@signup.com"
    fill_in :user_password, with: "signuppw"
    fill_in :user_password_confirmation, with: "signuppw"
    click_on "signup-user-action"

    expect(page).to_not have_content("New Signup")
    expect(page).to have_content("First name can't be blank")
  end

  scenario 'User gets error message when last name is left blank' do

    visit root_path
    click_on "Users"
    click_on "Sign Up"
    fill_in :user_first_name, with: 'New'
    fill_in :user_email, with: "new@signup.com"
    fill_in :user_password, with: "signuppw"
    fill_in :user_password_confirmation, with: "signuppw"
    click_on "signup-user-action"

    expect(page).to_not have_content("New Signup")
    expect(page).to have_content("Last name can't be blank")
  end

  scenario 'User gets error message when email is left blank' do

    visit root_path
    click_on "Users"
    click_on "Sign Up"
    fill_in :user_first_name, with: 'New'
    fill_in :user_last_name, with: "Signup"
    fill_in :user_password, with: "signuppw"
    fill_in :user_password_confirmation, with: "signuppw"
    click_on "signup-user-action"

    expect(page).to_not have_content("New Signup")
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'User gets error message when password is left blank' do

    visit root_path
    click_on "Users"
    click_on "Sign Up"
    fill_in :user_first_name, with: 'New'
    fill_in :user_last_name, with: "Signup"
    fill_in :user_email, with: "new@signup.com"
    click_on "signup-user-action"

    expect(page).to_not have_content("New Signup")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'User gets error message when password is left blank' do

    visit root_path
    click_on "Users"
    click_on "Sign Up"
    fill_in :user_first_name, with: 'New'
    fill_in :user_last_name, with: "Signup"
    fill_in :user_email, with: "new@signup.com"
    fill_in :user_password, with: "signuppw"
    fill_in :user_password_confirmation, with: "wrong"
    click_on "signup-user-action"

    expect(page).to_not have_content("New Signup")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

end
