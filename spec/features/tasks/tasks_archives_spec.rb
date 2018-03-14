require 'rails_helper'

RSpec.feature "Tasks::Archives", type: :feature do
  before(:each) do 
    create(:task, name: 'order pizza', status: Task.statuses[:done])
  end

  it 'archives done tasks' do 
    visit tasks_path

    within(:xpath, dt('done-items')) do 
      expect(page).to have_content('order pizza')

      find(dt('archive-task-link', 'a', false)).click
    end

    expect(page).to have_xpath(dt('flash-notice'))
    expect(page).to_not have_content('order pizza')
  end
end
