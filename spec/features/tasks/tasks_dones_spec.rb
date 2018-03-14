require 'rails_helper'

RSpec.feature "Tasks::Dones", type: :feature do
  describe 'clicking on done link' do 
    it 'moves task into done-items div' do 
      create(:task, name: 'learn to dance', status: Task.statuses[:todo])

      visit tasks_path

      find(dt('done-task-link', 'a')).click 

      within(:xpath, dt('done-items')) do 
        expect(page).to have_content('learn to dance')
        expect(page).to have_xpath(dt('flash-notice'))
      end
    end
  end
end
