require 'rails_helper'

RSpec.describe CommentPolicy, type: :policy do
  subject(:policy) { CommentPolicy.new(user, comment) }  

  describe '#create?' do
    subject { policy.create? }
    
    let(:member) { User.new(id: 42) }
    let(:project) { Project.new(users: [member]) }
    let(:task) { Task.new(project: project) }
    let(:comment) { Comment.new(task: task) }

    context 'when user is a member of project' do
      let(:user) { member }

      it { is_expected.to eq(true) }
    end

    context 'when user is not a member of project' do
      let(:user) { User.new(id: 43) }

      it { is_expected.to eq(false) }
    end
  end

  describe '#edit?' do
    subject { policy.edit? }

    let(:author) { User.new(id: 42) }
    let(:comment ) { Comment.new(user: author)}

    context 'user is an author of comment' do
      let(:user) { author }

      it { is_expected.to eq(true) }
    end

    context 'user is not an author of comment' do
      let(:user) { User.new(id: 43) }

      it { is_expected.to eq(false) }
    end
  end

  describe '#update?' do
    subject { policy.update? }

    let(:author) { User.new(id: 42) }
    let(:comment) { Comment.new(user: author) }

    context 'when user is an author of comment' do
      let(:user) { author }

      it { is_expected.to eq(true) }
    end

    context 'when usr is not an author or comment' do
      let(:user) { User.new(id: 43) }

      it { is_expected.to eq(false) }
    end
  end

  describe '#destroy?' do
    subject { policy.destroy? }

    let(:author) { User.new(id: 42) }
    let(:comment) { Comment.new(user: author) }

    context 'when user is an author of comment' do
      let(:user) { author }

      it { is_expected.to eq(true) }
    end

    context 'when usr is not an author or comment' do
      let(:user) { User.new(id: 43) }

      it { is_expected.to eq(false) }
    end
  end
end
