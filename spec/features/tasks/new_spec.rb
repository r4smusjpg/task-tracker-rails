require 'rails_helper'

RSpec.describe('create new task') do
  include_context 'when user signed in'

  let!(:project) { create(:project, user: current_user, name: 'Aboba project') }

  context 'when user is an author of project' do
    scenario 'user creates new task' do
      visit new_task_path

      fill_in 'Title', with: 'aboba example title'
      select project.name, from: 'Project'

      click_button 'Create Task'

      expect(page).to have_content 'Task was successfully created.'
      expect(page).to have_content "Project: #{project.name}"
      expect(page).to have_content 'Title: aboba example title'
    end
  end

  context 'when user is not an author of project' do
    let(:project) { create(:project) }

    scenario 'user creates new task' do
      visit new_task_path

      fill_in 'Title', with: 'aboba example title'
      select project.name, from: 'Project'

      click_button 'Create Task'

      expect(page).to have_current_path(projects_path)
      expect(page).to have_content 'not allowed to create? this Task'
    end
  end
end
