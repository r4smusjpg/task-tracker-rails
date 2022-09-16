require 'rails_helper'

RSpec.describe('creates new project') do
  include_context 'when user signed in'

  scenario 'user creates new project' do
    visit new_project_path

    fill_in 'Name', with: 'Project Name'
    fill_in 'Description', with: 'Project Desc'

    click_button 'Create Project'

    expect(page).to have_content 'Project was successfully created.'
    expect(page).to have_content 'Project Name'
    expect(page).to have_content 'Project Desc'
  end
end
