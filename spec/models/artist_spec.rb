require 'spec_helper'

describe Artist do
  it "should have a valid factory" do
    FactoryGirl.create(:artist).should be_valid
  end

  describe :is_group do
    it "should default to false" do
      Artist.new.is_group.should == false
      Artist.new(is_group: true).is_group.should be_true
    end

    it "default should not overwrite values pulled from store" do
      FactoryGirl.create(:artist, is_group: true)
      Artist.first.is_group.should == true
    end
  end

  describe :name do
    it "must be present and not blank" do
      FactoryGirl.build(:artist, name: nil).should_not be_valid
      FactoryGirl.build(:artist, name: "   ").should_not be_valid
    end

    it "must be unique (case-insensitive) in the scope of is_group" do
      FactoryGirl.create(:artist, name: "Holden McAwk", is_group: false)
      FactoryGirl.build(:artist, name: "Holden McAwk", is_group: false).should_not be_valid
      FactoryGirl.build(:artist, name: "holden mcawk", is_group: false).should_not be_valid
    end

    it "is allowed to have a group and person with the same name" do
      FactoryGirl.create(:artist, name: "Holden McAwk", is_group: true)
      FactoryGirl.build(:artist, name: "Holden McAwk", is_group: false).should be_valid
    end
  end

  it "should only have members if it is a group"
  it "should only have groups if it is a person"

  it "should have an album list" do
    expect { FactoryGirl.create(:artist).albums }.to_not raise_error
  end

  it "should have a track list" do
    expect { FactoryGirl.create(:artist).tracks }.to_not raise_error
  end
end
