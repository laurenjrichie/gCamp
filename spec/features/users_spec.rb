require 'rails_helper'

feature 'CRUDing users' do
  scenario 'Create a new user' do

    visit root_path
    click_on "Users"
    click_on "New User"
    fill_in :user_first_name, with: 'Shamus'
    fill_in :user_last_name, with: "McSteamy"
    fill_in :user_email, with: "shamus@mcsteamy.com"
    fill_in :user_password, with: "shamuspw"
    fill_in :user_password_confirmation, with: "shamuspw"
    click_on "Create User"

    expect(page).to have_content("Shamus McSteamy")
    expect(page).to have_content("User was successfully created")
  end

  scenario 'Edit a user' do
    User.create!(
      first_name: "Lamus",
      last_name: "McReamy",
      email: "lamus@mcsteamy.com",
      password: "lamuspw",
      password_confirmation: "lamuspw",
    )

    visit root_path
    click_on "Users"
    click_on "edit"
    fill_in :user_first_name, with: 'Cringle'
    fill_in :user_last_name, with: "McJingle"
    click_on "Update User"

    expect(page).to have_content("Cringle McJingle")
    expect(page).to have_content("User was successfully updated")
  end

  scenario 'List all users' do
    User.create!(
      first_name: "Momo",
      last_name: "Mo",
      email: "momo@momo.com",
      password: "momopw",
      password_confirmation: "momopw",
    )
    User.create!(
      first_name: "Yoyo",
      last_name: "Yo",
      email: "yoyo@yoyo.com",
      password: "yoyopw",
      password_confirmation: "yoyopw",
    )
    User.create!(
      first_name: "Lolo",
      last_name: "Lo",
      email: "lolo@lolo.com",
      password: "lolopw",
      password_confirmation: "lolopw",
    )

    visit root_path
    click_on "Users"

    expect(page).to have_content("Momo Mo")
    expect(page).to have_content("Yoyo Yo")
    expect(page).to have_content("Lolo Lo")
  end

  scenario 'Show a specific user' do
    User.create!(
      first_name: "Show",
      last_name: "Me",
      email: "showme@showme.com",
      password: "showpw",
      password_confirmation: "showpw",
    )

    User.create!(
      first_name: "Dontshow",
      last_name: "Me",
      email: "dontshowme@no.com",
      password: "dontpw",
      password_confirmation: "dontpw",
    )

    visit root_path
    click_on "Users"
    click_on "Show Me"
    expect(page).to have_content("Show Me")
    expect(page).to_not have_content("Dontshow Me")
  end

  scenario 'Delete user' do
    User.create!(
      first_name: "Delete",
      last_name: "Me",
      email: "delete@me.com",
      password: "deletepw",
      password_confirmation: "deletepw",
    )

    visit root_path
    click_on "Users"
    click_on "Delete Me"
    click_on "Edit"
    click_on "Delete User"

    expect(page).to_not have_content("Delete Me")
    expect(page).to have_content("User was successfully deleted")
  end

end
