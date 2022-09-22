require 'rails_helper'

RSpec.describe('edit task') do
  include_context 'when user signed in'
  let!(:project) { create(:project, users: [current_user]) }
  let!(:task) { create(:task, title: 'task title', description: 'task desc', project: project, status: 'not_started') }

  context 'when user is author of project' do
    scenario 'user edits task' do
       visit edit_task_path(task)

       fill_in 'Title', with: 'New Task Title'
       fill_in 'Description', with: 'New Task Desc'
       select 'started', from: 'Status'

       click_button 'Update Task'

       expect(page).to have_current_path task_path(task)
       expect(page).to have_content 'Task was successfully updated.'
       expect(page).to have_content 'New Task Title'
       expect(page).to have_content 'New Task Desc'
       expect(page).to have_content 'started'
    end
  end
end
