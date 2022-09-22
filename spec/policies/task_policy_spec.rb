require 'rails_helper'

RSpec.describe 'TaskPolicy', type: :policy do
  subject(:policy) { TaskPolicy.new(user, task) }

  describe '#index?' do
    subject { policy.index? }

    let(:task) { Task.new }

    context 'when user is authenticated' do
      let(:user) { User.new }

      it { is_expected.to eq(true) }
    end

    context 'when user is not authenticated' do
      let(:user) { nil }

      it { is_expected.to eq(false) }
    end
  end

  describe '#show?' do
    subject { policy.show? }


    let(:member) { User.new(id: 42) }
    let(:project) { Project.new(id: 43, users: [member]) }
    let(:task) { Task.new(id: 44, project: project) }

    context 'when user is a member of project' do
      let(:user) { member }

      it { is_expected.to eq(true) }
    end

    context 'when user is not a member of project' do
      let(:user) { User.new(id: 52) }

      it { is_expected.to eq(false) }
    end
  end

  describe '#create?' do
    subject { policy.create? }

    let(:member) { User.new(id: 42) }
    let(:project) { Project.new(id: 43, users: [member]) }
    let(:task) { Task.new(id: 44, project: project) }

    context 'when user is a member of project' do
      let(:user) { member }

      it { is_expected.to eq(true) }
    end

    context 'when user is not a member of project' do
      let(:user) { User.new(id: 52) }

      it { is_expected.to eq(false) }
    end
  end

  describe '#update?' do
    subject { policy.update? }

    let(:member) { User.new(id: 42) }
    let(:project) { Project.new(id: 43, users: [member]) }
    let(:task) { Task.new(id: 44, project: project) }

    context 'when user is a member of project' do
      let(:user) { member }

      it { is_expected.to eq(true) }
    end

    context 'when user is not a member of project' do
      let(:user) { User.new(id: 52) }

      it { is_expected.to eq(false) }
    end
  end

  describe '#destroy?' do
    subject { policy.destroy? }

    let(:member) { User.new(id: 42) }
    let(:project) { Project.new(id: 43, users: [member]) }
    let(:task) { Task.new(id: 44, project: project) }

    context 'when user is a member of project' do
      let(:user) { member }

      it { is_expected.to eq(true) }
    end

    context 'when user is not a member of project' do
      let(:user) { User.new(id: 52) }

      it { is_expected.to eq(false) }
    end
  end

  describe '#new?' do
    subject { policy.new? }

    let(:task) { Task.new }

    context 'when user is authenticated' do
      let(:user) { User.new }

      it { is_expected.to eq(true) }
    end

    context 'when user is not authenticated' do
      let(:user) { nil }

      it { is_expected.to eq(false) }
    end
  end
end
