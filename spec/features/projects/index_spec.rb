require 'rails_helper'

RSpec.describe 'view projects index' do
  include_context 'when user signed in'

  let!(:project1) { create(:project, name: 'Project #1') }
  let!(:project2) { create(:project, name: 'Project #2') }
  let!(:project3) { create(:project, name: 'Project #3') }

  scenario 'user views project index' do
    visit projects_path

    expect(page).to have_content 'Project #1'
    expect(page).to have_content 'Project #2'
    expect(page).to have_content 'Project #3'
    expect(page).to have_content 'Projects'
    expect(page).to have_content 'New Project'
  end
end
