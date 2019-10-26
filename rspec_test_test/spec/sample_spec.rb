require 'spec_helper'

RSpec.describe '四則演算' do
  it "1 + 1は2になること" do
    expect(1+1).to eq 2
  end
  it "10-1は9になること" do
    expect(10-1).to eq 9
  end
  it "全部できること" do
    expect(1+2).to eq 3
    expect(10-1).to eq 9
    expect(4*8).to eq 32
    expect(40/5).to eq 8
  end
  describe "足し算" do
    it "1 + 1は2になること" do
      expect(1+1).to eq 2
    end
  end
  describe "引き算" do
    it "10-1は9になること" do
      expect(10-1).to eq 9
    end
  end
end