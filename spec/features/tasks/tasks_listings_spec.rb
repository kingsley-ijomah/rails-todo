require 'rails_helper'

RSpec.feature "Tasks::Listings", type: :feature do
  describe 'clicking on new task link' do 
    it 'redirects to new task path' do 
      visit tasks_path

      find(dt('new-task-link', 'a')).click

      expect(page).to have_current_path(new_task_path)
    end
  end

  describe 'listing todo tasks' do 
    before(:each) do 
      Task.statuses.each do |status, value|
        create(:task, name: "#{status} learn to code", status: value)
      end

      visit tasks_path
    end

    context 'todo tasks' do 
      it 'lists todo tasks' do 
        within(:xpath, dt('todo-items')) do
          expect(page).to have_content("todo learn to code")
          expect(page).to_not have_content("archived to learn code")
          expect(page).to_not have_content("done learn to code")
        end
      end
    end

    context 'done tasks' do 
      it 'lists done tasks' do 
        within(:xpath, dt('done-items')) do
          expect(page).to have_content("done learn to code")
          expect(page).to_not have_content("archived to learn code")
          expect(page).to_not have_content("todo learn to code")
        end
      end
    end
  end
end
