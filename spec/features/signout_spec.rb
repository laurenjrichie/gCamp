require 'rails_helper'

feature 'Signing out' do
  scenario 'User can sign out after signing in' do
    User.create!(
      first_name: "New",
      last_name: "Signout",
      email: "new@signout.com",
      password: "signoutpw",
      password_confirmation: "signoutpw",
    )

    visit root_path
    click_on "Users"
    click_on "Sign In"
    fill_in :email, with: "new@signout.com"
    fill_in :password, with: "signoutpw"
    click_on "signin-user-action"

    expect(page).to have_content("New Signout")
    expect(page).to have_content("Sign Out")

    click_on "Sign Out"
    expect(page).to have_content("Sign In")
    expect(page).to_not have_content("Sign Out")
  end

end
