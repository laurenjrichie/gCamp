require 'rails_helper'

feature 'CRUDing projects' do
  scenario 'Create a new project' do

    visit root_path
    click_on "Projects"
    click_on "New Project"
    fill_in :project_name, with: 'My Project'
    click_on "Create Project"

    expect(page).to have_content("My Project")
    expect(page).to have_content("Project was successfully created")
  end

  scenario 'Edit a project' do
    Project.create!(
      name: "Project to Edit",
    )

    visit root_path
    click_on "Projects"
    click_on "Project to Edit"
    click_on "Edit"
    fill_in :project_name, with: 'Edited Project'
    click_on "Update Project"

    expect(page).to have_content("Edited Project")
    expect(page).to have_content("Project was successfully updated")
  end

  scenario 'List all projects' do
    Project.create!(
      name: "Project1",
    )
    Project.create!(
      name: "Project2",
    )
    Project.create!(
      name: "Project3",
    )

    visit root_path
    click_on "Projects"

    expect(page).to have_content("Project1")
    expect(page).to have_content("Project2")
    expect(page).to have_content("Project3")
  end

  scenario 'Show a specific project' do
    Project.create!(
      name: "Show this project",
    )
    Project.create!(
      name: "Dont show this project",
    )

    visit root_path
    click_on "Projects"
    click_on "Show this project"
    expect(page).to have_content("Show this project")
    expect(page).to_not have_content("Dont show this project")
  end

  scenario 'Delete project' do
    Project.create!(
      name: "Delete this project",
    )

    visit root_path
    click_on "Projects"
    click_on "Delete this project"
    click_on "Delete"

    expect(page).to_not have_content("Delete this project")
    expect(page).to have_content("Project was successfully deleted")
  end

end
