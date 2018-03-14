require 'rails_helper'

RSpec.feature "Tasks::Deletes", type: :feature do
  describe 'deleting tasks' do 
    it 'deletes todo task' do 
      create(:task, name: 'write a blog post', status: Task.statuses[:todo])

      visit tasks_path

      find(dt('delete-task-link', 'a')).click

      within(:xpath, dt('todo-items')) do 
        expect(page).to_not have_content('write a blog post')
        expect(page).to have_xpath(dt('flash-notice'))
      end
    end
  end
end
