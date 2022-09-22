require 'rails_helper'

RSpec.describe('edit the project') do
  include_context 'when user signed in'

  let(:project) { create(:project, users: [current_user]) }  

  scenario 'user edits project' do
    visit edit_project_path(project)

    fill_in 'Name', with: 'Cool new name for project'
    fill_in 'Description', with: 'Cool new description for project'

    click_button 'Update Project'
    expect(page).to have_current_path(project_path(project))
    expect(page).to have_content('Project was successfully updated.')
    expect(page).to have_content('Cool new name for project')
    expect(page).to have_content('Cool new description for project')
  end  
end
