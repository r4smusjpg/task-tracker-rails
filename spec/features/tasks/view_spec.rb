RSpec.describe('view a task') do
  include_context 'when user signed in'

  let!(:project) { create(:project, users: [current_user]) }
  let!(:task) { create(:task, project: project) }

  scenario 'user views a task' do
    visit task_path(task)

    expect(page).to have_content task.title
    expect(page).to have_content task.description
    expect(page).to have_content task.deadline_at.to_s(:long)
  end
end
