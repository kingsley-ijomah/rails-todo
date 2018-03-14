require 'rails_helper'

RSpec.feature "Tasks::Edits", type: :feature do
  before(:each) do 
    create(:task, name: 'go out running', status: Task.statuses[:todo])
    visit tasks_path
  end

  scenario 'valid task' do 
    expect(page).to have_content('go out running')

    find(dt('edit-task-link', 'a')).click

    expect {
      fill_in :task_name, with: 'go to the movies'

      click_button 'save task'
    }.to change(Task, :count).by(0)

    expect(page).to have_xpath(dt('flash-notice'))
    expect(page).to have_content('go to the movies')
    expect(page).to_not have_content('go out running')
  end

  scenario 'invalid task' do 
    find(dt('edit-task-link', 'a')).click 

    expect {
      fill_in :task_name, with: ''

      click_button 'save task'
    }.to change(Task, :count).by(0)
    
    expect(page).to have_xpath(dt('flash-alert'))
    expect(page).to have_xpath(dt('validation-errors'))
  end
end
