require 'rails_helper'

RSpec.describe 'view the project', type: :feature do
  include_context 'when user signed in'

  let(:project) { create(:project, name: 'A test project') }

  scenario 'User views a project' do
    visit project_path(project)

    expect(page).to have_content project.name
    expect(page).to have_content project.description
  end
end
