# ECサイト: 長野ケーキ
[![長野ケーキ概要PDF](./assets_readme/about.pdf)](./assets_readme/about.pdf)

DMM WEBCAMPのチーム開発で作成するアプリ。<br>
長野県にある小さな洋菓子店「ながのCAKE」（仮想ショップ）の商品を通販するためのECサイト開発。

## チーム名
*** Aチーム_三大都市 ***
### メンバー
- ちーさん
- なーさん
- あおいちゃん

## 開発環境
動作が確認できた環境は以下の通り。

| ソフトウェア  | バージョン    |
| ------- | -------- |
| Rails   | 6.1.7.10 |
| Node.js | v18.18.2 |
| Yarn    | 1.22.22  |

## イントロダクション
```
# 1. リポジトリをクローン
git clone https://github.com/webcamp-202504-team-A/nagano_cake.git
cd nagano_cake

# 2. 依存関係をインストール
bundle install
yarn install

# 3. データベースのセットアップ
rails db:create
rails db:migrate
rails db:seed

# 4. サーバーを起動
rails s
```

## 機能
- 管理者・会員登録
- 商品のジャンル登録
- 商品登録
- 会員管理
- 配送先登録・編集
- カート機能
- 注文機能
- ステータス機能

## 得られたノウハウ
- WBS（ProjectSheet planningの取り扱い）
- データベース設計
- ER図作成（drow.ioの取り扱い）
- テーブル定義書の作成
- アプリケーション詳細設計
- Githubのチーム運用（チーム作成、gitignoreの取り扱い、PR作成などの開発フロー、コンフリクトの解消、reset・revertなどのミスをした時の対応）
- レイアウト調整（scss, css設計）
- deviseによる管理者・顧客の分離、管理者権限設定
- CRUD機能
- enumの取り扱い
- kaminariの取り扱い（ページネーション）
