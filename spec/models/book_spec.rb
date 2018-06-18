# frozen_string_literal: true

require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:genre)
  end
  it do
    should validate_presence_of(:author)
  end
  it do
    should validate_presence_of(:image)
  end
  it do
    should validate_presence_of(:title)
  end
  it do
    should validate_presence_of(:publisher)
  end
  it do
    should validate_presence_of(:year)
  end

  subject(:book) do
    build(:book, genre: genre, author: author, title: title, image: image, publisher: publisher,
                 year: year)
  end

  let(:genre) { Faker::Book.genre }
  let(:author) { Faker::Book.author }
  let(:title) { Faker::Book.genre }
  let(:image) { Faker::File.file_name('images', title, 'png') }
  let(:publisher) { Faker::Book.publisher }
  let(:year) { Faker::Date.between(50.years.ago, Time.zone.today).year }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'when the genre is nil' do
      let(:genre) { nil }
      it do
        is_expected.to be_invalid
      end
    end

    context 'when the author is nil' do
      let(:author) { nil }
      it do
        is_expected.to be_invalid
      end
    end

    context 'when the image is nil' do
      let(:image) { nil }
      it do
        is_expected.to be_invalid
      end
    end

    context 'when the title is nil' do
      let(:title) { nil }
      it do
        is_expected.to be_invalid
      end
    end

    context 'when the publisher is nil' do
      let(:publisher) { nil }
      it do
        is_expected.to be_invalid
      end
    end

    context 'when the year is nil' do
      let(:year) { nil }
      it do
        is_expected.to be_invalid
      end
    end
  end
end
