require 'spec_helper'

describe Album do
  it "must have a valid factory" do
    FactoryGirl.create(:album).should be_valid
  end

  describe :artist do
    it "must be present" do
      FactoryGirl.build(:album, artist: nil).should_not be_valid
    end
  end

  describe :name do
    it "must be present" do
      FactoryGirl.build(:album, name: nil).should_not be_valid
    end

    it "must not be an empty or whitespace-only string" do
      FactoryGirl.build(:album, name: "").should_not be_valid
      FactoryGirl.build(:album, name: "  ").should_not be_valid
    end

    it "must be unique in scope of artist" do
      artist = FactoryGirl.create(:artist)

      FactoryGirl.create(:album, artist: artist, name: "Yo Momma")
      FactoryGirl.build(:album, artist: artist, name: "Yo Momma").should_not be_valid
    end

    it "should be able to have duplicate names across different artists" do
      FactoryGirl.create(:album, name: "Yo Momma")
      FactoryGirl.build(:album, name: "Yo Momma").should be_valid
    end
  end

  describe :is_compilation do
    it "should default to false" do
      Album.new.is_compilation.should == false
    end

    it "default should be overriden when passed value on init" do
      Album.new(is_compilation: true).is_compilation.should be_true
    end

    it "default should not overwrite values pulled from store" do
      FactoryGirl.create(:album, is_compilation: true)
      Album.first.is_compilation.should == true
    end
  end

  it "should have a disc list" do
    expect { FactoryGirl.create(:album).discs }.to_not raise_error
  end

  it "should have at least one disc" do
    FactoryGirl.create(:album).discs.should_not be_empty
  end
end
