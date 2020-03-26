![logo ](https://user-images.githubusercontent.com/59257057/77410560-644b5200-6dfe-11ea-977c-84e615868c96.png)
# pets
このアプリケーションは、
登録しているユーザーがペットについてのブログを投稿して交流をしたり、
お世話記録をつけて家族などとペットの世話の内容を共有することができます。

# Dependency
Rails '~> 5.2.4', '>= 5.2.4.1'

# Setup
$ git clone https://github.com/kaori48/pets.git  
$ bundle install  
$ rails g devise:install  
$ rails db:migrate  


# Usage
[マイページ]  
 　ユーザーの情報（アイコン、名前、自己紹介、退会）の変更、お世話パートナー申請の許可、拒否、パートナー一覧を見ることができます  
  マイページは ヘッダー>マイページ　もしくは画面左の自分のアイコン下＞マイページからアクセスできます。  
  <img width="1432" alt="マイページ" src="https://user-images.githubusercontent.com/59257057/77417396-a5486400-6e08-11ea-93d7-65c5915c84c3.png">  
  
[ブログ機能]  
  プラスボタンから新規投稿が可能です。画像投稿やタイトル、本文が投稿できる他、ジャンルを複数選択可能です。  
  ユーザーのアイコンをクリックするとそのユーザーのブログ投稿一覧が閲覧できます。
  <img width="1406" alt="ブログ一覧２" src="https://user-images.githubusercontent.com/59257057/77416490-3d454e00-6e07-11ea-9f26-fdcbe151de6b.png">  
  左下「ジャンル一覧」からジャンルごとの一覧を表示可能です。  
  ブログ詳細画面ではいいね、コメントが可能です。  
  管理者はブログ、コメントの削除権限を持ちます   
  <img width="1435" alt="コメント、いいね" src="https://user-images.githubusercontent.com/59257057/77416510-433b2f00-6e07-11ea-8ae0-b4ec0a3c6ab7.png">  

[検索機能]  
  ヘッダーからユーザー、ブログのあいまい検索が可能です。該当しない場合一覧が表示されます。  
  <img width="1435" alt="検索結果" src="https://user-images.githubusercontent.com/59257057/77416348-1a1a9e80-6e07-11ea-851a-c21d7203b722.png">  
  <img width="1422" alt="検索結果なし" src="https://user-images.githubusercontent.com/59257057/77416364-1d158f00-6e07-11ea-9cb1-9480055562df.png">  

[フォロー機能]  
　 左側のアイコン下の「フォローする」ボタンからフォローが可能です。 
 　フォローを外す場合は左側アイコン下の「フォローを外す」ボタンから行うことができます。  
　 フォロー、フォロワー一覧はアイコン下のフォロー、フォロワー数から見ることができます。  

[ペットお世話記録]  
　自分がお世話をしているペットのお世話記録をつけることができます。こちらは登録した本人と後に紹介する「お世話パートナー」のみ見ることができます。  
  左側のアイコン下、「お世話記録」から自分の登録したペット一覧が表示できます。  
  ペットの情報を登録はプラスボタンから行います。  
  ペットの情報詳細では記録の更新やコメント、ペットごとに ToDoList機能がついています。  
  <img width="1423" alt="ペット一覧" src="https://user-images.githubusercontent.com/59257057/77416313-138c2700-6e07-11ea-8d31-5e6429c2d2ba.png">  
  <img width="1420" alt="ペット詳細" src="https://user-images.githubusercontent.com/59257057/77416336-1850db00-6e07-11ea-83f7-019395ec12a0.png">  
  
 [ToDoList]  
  ペットごとにタスクの記録が可能です。  
  チェックボックスをつけることで進行度が確認できます（チェックボックスは非同期通信で稼働しています。)  
  削除を行う場合は「✖️」ボタンから行うことができます。  

　[ペットお世話パートナー機能]  
 　限定された人とお世話パートナーになることができます。（自分のペットお世話記録の閲覧権限を付与します。）  
    ❶パートナー申請を行う側  
     申請を行いたい相手のアイコンをクリックし、画面左の「お世話パートナー申請」をクリックすることでパートナー申請を行います。  
     申請中の場合は「お世話パートナー申請中」と表示されます、申請の取り消しはその下の「申請解除」ボタンから行います。  
     許可された場合は「マイページ」の「お世話パートナー」に表示されます。  
     お世話記録一覧は 相手のアイコンをクリック＞画面左アイコン下の「お世話記録」から閲覧できます。  
     お世話パートナーを解除する場合は   相手のアイコンをクリック＞画面左アイコン下の「パートナー解除」　から行うことができます  
     <img width="428" alt="申請" src="https://user-images.githubusercontent.com/59257057/77417962-88f8f700-6e09-11ea-9a79-a7859ed86d03.png">
<img width="397" alt="申請中" src="https://user-images.githubusercontent.com/59257057/77417968-8a2a2400-6e09-11ea-987f-b24afde13ecc.png">
<img width="360" alt="パートナー解除" src="https://user-images.githubusercontent.com/59257057/77417969-8b5b5100-6e09-11ea-8245-db4bdeab23d2.png">  
    ❷パートナー申請を受ける側  
     申請は「マイページ」の「お世話パートナー申請」に表示されます。  
     申請を許可する場合は「申請許可」、不可の場合は「申請拒否」ボタンから行うことができます。     
   <img width="1398" alt="パート申請受け" src="https://user-images.githubusercontent.com/59257057/77416894-d8d6be80-6e07-11ea-9c94-ab2f2d49dee4.png">  
   お世話パートナーを解除する場合は、ペットお世話記録＞パートナー一覧から解除可能です（お世話記録のペットを登録した本人のみ可能です。） 
     
   <img width="385" alt="ペット詳細" src="https://user-images.githubusercontent.com/59257057/77418693-982c7480-6e0a-11ea-931c-418304f0ee7b.png">  
   
 
# License
This software is released under the MIT License, see LICENSE.

# Authors
Github:kaori48
