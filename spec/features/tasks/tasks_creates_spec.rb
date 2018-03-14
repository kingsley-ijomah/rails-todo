require 'rails_helper'

RSpec.feature "Tasks::Creates", type: :feature do
  describe 'creating tasks' do 
    before(:each) do 
      visit new_task_path
    end

    scenario 'valid task' do 
      expect {
        fill_in :task_name, with: 'learn to code with kingsley'

        click_button 'save task'
      }.to change(Task, :count).by(1)

      expect(page).to have_xpath(dt('flash-notice'))
      expect(page).to have_current_path(tasks_path)
    end

    scenario 'invalid task' do 
      expect {
        fill_in :task_name, with: ''

        click_button 'save task'
      }.to change(Task, :count).by(0)

      expect(page).to have_xpath(dt('flash-alert'))
      expect(page).to have_xpath(dt('validation-errors'))
    end
  end
end
