require 'rails_helper'

Rspec.describe Post do, tupe: :sysetem do
  describe 'Post CRUD' do
    # index page test
    describe '投稿一覧' do

    end
    
    # new page test
    describe '新規投稿' do
      describe 'ログイン前' do
        context 'ログイン画面へ遷移' do

        end

      end
      describe 'ログイン後' do
        context 'フォームの入力値が正常' do
          it '新規投稿が成功' do

          end
        end

        context '必要項目が未記入' do
          it '新規投稿が失敗' do

          end
        end

      end

    end

    # show page test
    describe '詳細' do

    end
    # edit page test
    describe '編集' do

    end


  end
end

end
