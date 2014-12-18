require 'rails_helper'

feature 'Signing in' do
  scenario 'User can sign in with valid info' do
    User.create!(
      first_name: "New",
      last_name: "Signin",
      email: "new@signin.com",
      password: "signinpw",
      password_confirmation: "signinpw",
    )

    visit root_path
    click_on "Users"
    click_on "Sign In"
    fill_in :email, with: "new@signin.com"
    fill_in :password, with: "signinpw"
    click_on "signin-user-action"

    expect(page).to have_content("New Signin")
    expect(page).to have_content("Sign Out")
  end

  scenario 'User gets error message when email is left blank' do
    User.create!(
      first_name: "New",
      last_name: "Signin",
      email: "new@signin.com",
      password: "signinpw",
      password_confirmation: "signinpw",
    )

    visit root_path
    click_on "Users"
    click_on "Sign In"
    fill_in :password, with: "signinpw"
    click_on "signin-user-action"

    expect(page).to_not have_content("New Signin")
    expect(page).to have_content("Username / password combination is invalid")
  end

  scenario 'User gets error message when password is left blank' do
    User.create!(
      first_name: "New",
      last_name: "Signin",
      email: "new@signin.com",
      password: "signinpw",
      password_confirmation: "signinpw",
    )

    visit root_path
    click_on "Users"
    click_on "Sign In"
    fill_in :email, with: "new@signin.com"
    click_on "signin-user-action"

    expect(page).to_not have_content("New Signin")
    expect(page).to have_content("Username / password combination is invalid")
  end

  scenario 'User gets error message when signing in with user that does not exist' do
    User.create!(
      first_name: "New",
      last_name: "Signin",
      email: "new@signin.com",
      password: "signinpw",
      password_confirmation: "signinpw",
    )

    visit root_path
    click_on "Users"
    click_on "Sign In"
    fill_in :email, with: "nouser@no.com"
    fill_in :password, with: "nouser"
    click_on "signin-user-action"

    expect(page).to_not have_content("New Signin")
    expect(page).to have_content("Username / password combination is invalid")
  end

  scenario 'User gets error message when password for existing user is entered wrong' do
    User.create!(
      first_name: "New",
      last_name: "Signin",
      email: "new@signin.com",
      password: "signinpw",
      password_confirmation: "signinpw",
    )

    visit root_path
    click_on "Users"
    click_on "Sign In"
    fill_in :email, with: "new@signin.com"
    fill_in :password, with: "oopstypo"
    click_on "signin-user-action"

    expect(page).to_not have_content("New Signin")
    expect(page).to have_content("Username / password combination is invalid")
  end

end
