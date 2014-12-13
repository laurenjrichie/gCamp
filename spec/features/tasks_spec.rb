require 'rails_helper'

feature 'CRUDing tasks' do
  scenario 'Create a new task' do

    visit root_path
    click_on "Tasks"
    click_on "New Task"
    fill_in :task_description, with: 'New Task'
    click_on "Create Task"

    expect(page).to have_content("New Task")
    expect(page).to have_content("Task was successfully created")
  end

  scenario 'Edit a task' do
    Task.create!(
      description: "Task to Edit",
    )

    visit root_path
    click_on "Tasks"
    click_on "Edit"
    fill_in :task_description, with: 'Edited Task'
    click_on "Update Task"

    expect(page).to have_content("Edited Task")
    expect(page).to have_content("Task was successfully updated")
  end

  scenario 'List all tasks' do
    Task.create!(
      description: "Task",
    )
    Task.create!(
      description: "Task2",
    )
    Task.create!(
      description: "Task3",
    )

    visit root_path
    click_on "Tasks"

    expect(page).to have_content("Task")
    expect(page).to have_content("Task2")
    expect(page).to have_content("Task3")
  end

  scenario 'Show a specific task' do
    Task.create!(
      description: "Show this task",
    )
    # Task.create!(
      # description: "Dont show this task",
    # )

    visit root_path
    click_on "Tasks"
    click_on "Show"
    expect(page).to have_content("Show this task")
    # expect(page).to_not have_content("Dont show this task")
  end

  scenario 'Delete task' do
    Task.create!(
      description: "Delete this task",
    )

    visit root_path
    click_on "Tasks"
    click_on "Destroy"

    expect(page).to_not have_content("Delete this task")
    expect(page).to have_content("Task was successfully destroyed")
  end

end
