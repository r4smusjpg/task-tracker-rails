require 'rails_helper'

RSpec.describe 'visit projects index' do
  include_context 'when user signed in'

  let!(:project1) { create(:project, name: 'Project #1', users:) }
  let!(:project2) { create(:project, name: 'Project #2') }
  let!(:project3) { create(:project, name: 'Project #3') }

  scenario 'user views project index' do
    visit projects_path

    expect(page).to have_content 'Projects'
    expect(page).to have_table
    expect(page).to have_content project1.name
    expect(page).to have_content project2.name
    expect(page).to have_content project3.name
    expect(page).to have_content 'New Project'
  end
end
