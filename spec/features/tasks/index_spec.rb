require 'rails_helper'

RSpec.describe('visit tasks index') do
  include_context 'when user signed in'
  let!(:project) { create(:project, name: 'Sample project') }
  let!(:task1) { create(:task, project: project, title: 'Task 1') }
  let!(:task2) { create(:task, project: project, title: 'Task 2') }
  let!(:task3) { create(:task, project: project, title: 'Task 3') }

  scenario 'user views tasks index' do
    visit tasks_path

    expect(page).to have_content 'Tasks'
    expect(page).to have_table
    expect(page).to have_content 'New Task'
    expect(page).to have_content task1.title
    expect(page).to have_content task2.title
    expect(page).to have_content task3.title
  end
end
