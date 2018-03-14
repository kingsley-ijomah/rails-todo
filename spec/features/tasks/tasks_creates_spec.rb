require 'rails_helper'

RSpec.feature "Tasks::Creates", type: :feature do
  describe 'creating tasks' do 
    before(:each) do 
      visit new_task_path
    end

    scenario 'valid task' do 

    end

    scenario 'invalid task' do 

    end
  end
end
