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

    let(:project) { Project.new(name: 'project', user_id: 42) }
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

  describe '#create?' do
    subject { policy.create? }

    let(:creator) { User.new(id: 43) }
    let(:project) { Project.new(id: 42, user: creator) }
    let(:task) { Task.new(project: project) }

    context 'when user is creator of the project' do
      let(:user) { creator }
    
      it { is_expected.to eq(true) }
    end

    context 'when user is not creator of the project' do
      let(:user) { User.new(id: 44) }
    
      it { is_expected.to eq(false) }
    end
  end

  describe '#update?' do
    subject { policy.update? }

    let(:creator) { User.new(id: 43) }
    let(:project) { Project.new(id: 42, user: creator) }
    let(:task) { Task.new(project: project) }

    context 'when user is creator of the project' do
      let(:user) { creator }
    
      it { is_expected.to eq(true) }
    end

    context 'when user is not creator of the project' do
      let(:user) { User.new(id: 44) }
    
      it { is_expected.to eq(false) }
    end
  end

  describe '#destroy?' do
    subject { policy.destroy? }

    let(:creator) { User.new(id: 43) }
    let(:project) { Project.new(id: 42, user_id: creator.id) }
    let(:task) { Task.new(project: project) }

    context 'when user is creator of the project' do
      let(:user) { creator }
    
      it { is_expected.to eq(true) }
    end

    context 'when user is not creator of the project' do
      let(:user) { User.new(id: 44) }
    
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
