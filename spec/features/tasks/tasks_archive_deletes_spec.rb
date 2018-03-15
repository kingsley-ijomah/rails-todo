require 'rails_helper'

RSpec.feature "Tasks::ArchiveDeletes", type: :feature do
  it 'deletes archived tasks' do 
    create(:task, name: 'go swimming', status: Task.statuses[:archived])

    visit archives_path

    expect(page).to have_content('go swimming')

    find(dt('delete-archive-link', 'a')).click

    expect(page).to_not have_content('go swimming')
    expect(page).to have_xpath(dt('flash-notice'))
  end
end
