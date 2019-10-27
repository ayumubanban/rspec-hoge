# * https://qiita.com/t2kojima/items/ad7a8ade9e7a99fb4384#fnref1

require 'rails_helper'

RSpec.describe UsersController, type: :request do

  describe 'GET #index' do
    before do
      FactoryBot.create :takashi
      FactoryBot.create :satoshi
    end

    it 'リクエストが成功すること' do
      get "/users"
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      get "/users"
      # puts response.inspect
      expect(response.body).to include "Takashi"
      expect(response.body).to include "Satoshi"
    end
  end

  describe "GET #show" do
    context "ユーザーが存在する場合" do
      let(:takashi) { FactoryBot.create :takashi }

      it "リクエストが成功すること" do
        get "/users/#{takashi.id}"
        expect(response.status).to eq 200
      end

      it "ユーザー名が表示されていること" do
        get "/users/#{takashi.id}"
        expect(response.body).to include("Takashi")
      end
    end

    context "ユーザーが存在しない場合" do
      subject { -> { get "/users/1" } }

      # * raise_error エラーが起きることを検証
      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end

  describe "GET #new" do
    it "リクエストが成功すること" do
      get "/users/new"
      expect(response.status).to eq 200
    end
  end

  describe "GET #edit" do
    let(:takashi) { FactoryBot.create :takashi }

    it "リクエストが成功すること" do
      get "/users/#{takashi.id}/edit"
      expect(response.status).to eq 200
    end

    it "ユーザー名が表示されていること" do
      get "/users/#{takashi.id}/edit"
      expect(response.body).to include "Takashi"
    end

    it "メールアドレスが表示されていること" do
      get "/users/#{takashi.id}/edit"
      expect(response.body).to include "takashi@example.com"
    end
  end

  describe "POST #create" do
    context "パラメータが妥当な場合" do
      it "リクエストが成功すること" do
        post "/users", params: { user: FactoryBot.attributes_for(:user) }
        expect(response.status).to eq 302
      end

      it "ユーザーが登録されること" do
        expect do
          post "/users", params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by(1)
      end

      it "リダイレクトすること" do
        post "/users", params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to User.last
      end
    end

    context "パラメータが不正な場合" do
      it "リクエストが成功すること" do
        post "/users", params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.status).to eq 200
      end

      it "ユーザーが登録されないこと" do
        expect do
          post "/users", params: { user: FactoryBot.attributes_for(:user, :invalid) }
        end.to_not change(User, :count)
      end

      it "エラーが表示されること" do
        post "/users", params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.body).to include "prohibited this user from being saved"
      end
    end
  end

  describe "PUT #update" do
    let(:takashi) { FactoryBot.create :takashi }

    context "パラメータが妥当な場合" do
      it "リクエストが成功すること" do
        put "/users/#{takashi.id}", params: { user: FactoryBot.attributes_for(:satoshi) }
        expect(response.status).to eq 302
      end

      it "ユーザー名が更新されること" do
        expect do
          put "/users/#{takashi.id}", params: { user: FactoryBot.attributes_for(:satoshi) }
        end.to change { User.find(takashi.id).name }.from("Takashi").to("Satoshi")
      end

      it "リダイレクトすること" do
        put "/users/#{takashi.id}", params: { user: FactoryBot.attributes_for(:satoshi) }
        expect(response).to redirect_to User.last
      end
    end

    context "パラメータが不正な場合" do
      it "リクエストが成功すること" do
        put "/users/#{takashi.id}", params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.status).to eq 200
      end

      it "ユーザー名が変更されないこと" do
        expect do
          put "/users/#{takashi.id}", params: { user: FactoryBot.attributes_for(:user, :invalid) }
        end.to_not change(User.find(takashi.id), :name)
      end

      it "エラーが表示されること" do
        put "/users/#{takashi.id}", params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.body).to include "prohibited this user from being saved"
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { FactoryBot.create :user }

    it "リクエストが成功すること" do
      delete "/users/#{user.id}"
      expect(response.status).to eq 302
    end

    it "ユーザーが削除されること" do
      expect do
        delete "/users/#{user.id}"
      end.to change(User, :count).by(-1)
    end

    it "ユーザー一覧にリダイレクトすること" do
      delete "/users/#{user.id}"
      expect(response).to redirect_to("/users")
    end
  end

end