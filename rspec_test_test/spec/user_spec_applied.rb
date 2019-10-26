require 'spec_helper'

RSpec.describe User do
  describe "#greet" do
    let(:user){ User.new(name: "たろう", age: age) }
    subject { user.greet }

    shared_examples "子どものあいさつ" do
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end
    context "0歳の場合" do
      let(:age){ 0 }
      it_behaves_like "子どものあいさつ"
    end
    context "12歳の場合" do
      let(:age){ 12 }
      it_behaves_like "子どものあいさつ"
    end

    shared_examples "大人のあいさつ" do
      it { is_expected.to eq "僕はたろうです。" }
    end
    context "13歳の場合" do
      let(:age){ 13 }
      it_behaves_like "大人のあいさつ"
    end
    context "100歳の場合" do
      let(:age){ 100 }
      it_behaves_like "大人のあいさつ"
    end
  end

  describe "#child?" do
    let(:user){ User.new(name: "たろう", age: age)}
    subject{ user.child? }
    context "12歳以下の場合" do
      let(:age){ 12 }
      it { is_expected.to eq true }
    end
    context "13歳以上の場合" do
      let(:age){ 13 }
      it { is_expected.to eq false }
    end
  end
end