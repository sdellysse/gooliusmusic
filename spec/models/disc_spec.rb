require 'spec_helper'

describe Disc do
  it "has a number" do
    expect { FactoryGirl.build(:disc).number }.to_not raise_error
  end
end
