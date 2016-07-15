require 'rails_helper'

describe Prototype do
  describe 'associations' do
    describe 'with comments' do
      let!(:prototype){ create(:prototype, :prototype_with_comments, comments_count: 1) }
      it 'is deletes the comments when prototype is deleted' do
        expect { prototype.destroy }.to change { Comment.count }.by(-1)
      end
    end

    describe 'with likes' do
      let!(:prototype){ create(:prototype, :prototype_with_likes, likes_count: 1) }
      it 'is deletes the likes when prototype is deleted' do
        expect { prototype.destroy }.to change { Like.count }.by(-1)
      end
    end
  end

  describe 'validations' do
    describe "with valid attributes" do
      it 'has a valid factory' do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    describe "without valid attributes" do
      it 'is missing a title' do
        prototype = build(:prototype, title: nil)
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it 'is missing a catch_copy' do
        prototype = build(:prototype, catch_copy: nil)
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it 'is missing a concept' do
        prototype = build(:prototype, concept: nil)
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe '#liked_by?(user)' do
    describe 'when liked by a user' do
      it 'return true' do
        user = create(:user)
        prototype = create(:prototype, user: user)
        like = create(:like, prototype: prototype, user: user)
        expect(prototype.liked_by?(user)).to be_truthy
      end
    end

    describe 'when not liked by a user' do
      it 'return nil' do
        user = create(:user)
        another_user = create(:user)
        prototype = create(:prototype, user: another_user)
        like = create(:like, prototype: prototype, user: another_user)
        expect(prototype.liked_by?(user)).to be_falsey
      end
    end
  end

  describe '#sub_image' do
    it "returns an array containing sub_images" do
      prototype = create(:prototype, :with_sub_images)
      expect(prototype.sub_image).to eq prototype.sub_images
    end
  end

  describe 'rejet_sub_images(attributed)' do
    it "doesn't save a record with nil content" do
      sub_image = build(:sub_image, name: nil)
      sub_image.valid?
      expect(sub_image.errors[:name]).to include("can't be blank")
    end
  end
end
