require 'rails_helper'

describe Image do
  describe '#create' do
    it 'has the wrong content format' do
      image = build(:main_image, name: fixture_file_upload("img/sample.tif", 'image/tif'))
      image.valid?
      expect(image.errors[:name][0]).to include("You are not allowed to upload")
    end

    describe 'with valid attributes' do
      it 'has a valid factory' do
        image = build(:main_image)
        expect(image).to be_valid
      end
    end

    describe 'without content attribute' do
      it 'returns error' do
        image = build(:main_image, name: nil)
        image.valid?
        expect(image.errors[:name]).to include("can't be blank")
      end
    end

    describe 'without status attribute' do
      it 'returns error' do
        image = build(:main_image, status: nil)
        image.valid?
        expect(image.errors[:status]).to include("can't be blank")
      end
    end
  end
end
