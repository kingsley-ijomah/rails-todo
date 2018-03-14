require 'rails_helper'

RSpec.feature "Tasks::ArchiveListings", type: :feature do
  it 'lists archived tasks' do 
    @archived = create(:task, name: 'go swimming', status: Task.statuses[:archived])
    @todo = create(:task, name: 'go for lunch', status: Task.statuses[:todo])
    @done = create(:task, name: 'learn to code', status: Task.statuses[:done])

    visit archives_path

    expect(page).to have_content(@archived.name)

    expect(page).to_not have_content(@todo.name)
    expect(page).to_not have_content(@done.name)
  end

  it 'has a clickable archives link' do 
    @archived = create(:task, name: 'go swimming', status: Task.statuses[:archived])

    visit tasks_path

    find(dt('archives-link', 'a')).click 

    expect(page).to have_content(@archived.name)
    expect(page).to have_current_path(archives_path)
  end
end
