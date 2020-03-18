# アプリ名
## IT-Dictionary

## 概要実装機能
  IT業界(プログラミング言語)に特化した簡易版辞書APL

## 制作背景
  プログラミング学習において、不明名単語や覚えられない単語をメモしておき、簡単に検索できることを目的としました。また、流行の言語を把握する為のタグ機能や、分かりやすかった投稿に対してのいいね機能を実装しました。

## 実装機能
- 新規投稿・編集・削除機能
- ユーザー管理機能(gem:devise)
- 検索機能(非同期通信)
- いいね機能
- タグ管理機能(gem:acts-as-taggable-on)

## 本番環境(デプロイ先とテストアカウント＆ID)
- GitHub:https://github.com/issei1213/it-dictionary
- デプロイ先:http://18.176.136.248/
- テストアカウント: Email: test123@gmail.com / Password: test1232020

## DEMO
## トップ画面
![image](https://user-images.githubusercontent.com/59830008/76284294-3b946a00-62e0-11ea-8c62-c46943b3e481.png)

## 投稿画面
![image](https://user-images.githubusercontent.com/59830008/76284326-4fd86700-62e0-11ea-912f-0264ad0b9998.png)

## 編集画面
![image](https://user-images.githubusercontent.com/59830008/76284361-6f6f8f80-62e0-11ea-8efa-29d4bdfb2321.png)

## ユーザ登録画面
![image](https://user-images.githubusercontent.com/59830008/76284379-7bf3e800-62e0-11ea-9854-ecc562f3be67.png)


## 工夫したポイント
 - タグのgem(acts-as-taggable-on)をインストールする際に、不具合がありインストールできかった事。(マイグレーションファイルに不具合あり)
 - 検索結果タグ表示時に、gem(acts-as-taggable-on)の特有のメソッドを使用する為、gemの使い方を把握する必要があった。
 - 検索する時に内容とタイトルで検索する実装をした事。


## 使用技術(開発環境)
  - 言語：Haml,SCSS,Ruby,jQuery
  - ツール：Ruby on Rails
  - DB：mysql
  - サーバー：AWS

## 課題や今後実装したい機能
  - 画像投稿機能
  - インクリメンタルサーチのプルダウンで場合分け
  - タグ登録時のplugin機能
  - いいね機能のデザイン変更・非同期通信
  - 投稿時の５W１H入力
  - コメント機能（非同期通信）

## DB設計
![データベース ER図](https://user-images.githubusercontent.com/59830008/76284469-c7a69180-62e0-11ea-9ab1-68c0278c42ce.jpeg)
