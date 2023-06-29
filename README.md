# Desk&Device-sharing（仮）
デスク環境を投稿して共有できるWebアプリケーションです。<br>
他ユーザーのデスクの見た目や使用しているデバイスの検索や自分のデスク環境を共有できるサービスです。<br>

## 使用技術
・Ruby<br>
・Ruby on Rails <br>
・MyAQL <br>
・Docker <br>
・CI/CD CircleCI<br>
・Rspec <br>
・Rubocop <br>
・AWS <br>

## 機能一覧
・ログイン機能(devise)<br>
  -アイコン設定、ユーザー名登録<br>
  -ゲストログイン機能<br>

・Top画面 <br>
  -いいね数ランキングの表示<br>
  -最近の投稿の表示<br>
  -カテゴリー別検索機能<br>

・新規投稿画面<br>
  -画像、タイトル、説明文、カテゴリー登録<br>

・投稿一覧画面<br>
  -並べ替え機能(いいね数、投稿日の昇順・降順)<br>
  -カテゴリー絞り込み機能<br>

・投稿詳細機能<br>
  -アイテム登録機能<br>
  -いいね機能<br>
  -ブックマーク機能<br>
  -コメント機能<br>

・マイページ画面
  -アカウントの編集機能
  -投稿の管理
  -いいねした投稿の表示
  -ブックマークした投稿の表示


## テストフレームワーク
・RSpec<br>
  -factories<br>
  -system spec<br>
  -models spec<br>
  -requests spec<br>

## ER図
<img width="967" alt="スクリーンショット 2021-08-26 13 08 15" src="/Users/doiryousuke/portfolio_rails/erd.pdf">
