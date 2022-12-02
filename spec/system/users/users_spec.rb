require 'rails_helper'

Rspec.describe User, type: :system do
  let(:user) { create(:user)}
  let(other_user) {create(:user)}

  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do

          end

        end

        context '必要項目が未記入' do
          it 'ユーザーの新規作成が失敗' do

          end

        end

        context '登録済み' do
          it 'ユーザーの新規作成が失敗' do

          end

        end

      end

    end

    describe 'ログイン後' do
      describe 'ユーザー編集' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの編集が成功' do

          end

        end
        context '必要項目が未記入' do
          it 'ユーザーの編集が失敗' do
            
          end

        end

      end

    end

  end

end
