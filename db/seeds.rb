# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories
# 親要素
lady = Category.create(:name=>"レディース")
men = Category.create(:name=>"メンズ")
baby = Category.create(:name=>"ベビー・キッズ")
other = Category.create(:name=>"その他")


# 子要素
lady_tops = lady.children.create(:name=>"トップス")
lady_jackets = lady.children.create(:name=>"ジャケット/アウター")
lady_pants = lady.children.create(:name=>"パンツ")
lady_skirts = lady.children.create(:name=>"スカート")
lady_onepieces = lady.children.create(:name=>"ワンピース")
lady_shoes = lady.children.create(:name=>"靴")
lady_pajamas = lady.children.create(:name=>"ルームウェア/パジャマ")
lady_legwears = lady.children.create(:name=>"レッグウェア")
lady_caps = lady.children.create(:name=>"帽子")
lady_bags = lady.children.create(:name=>"バッグ")
lady_accessories = lady.children.create(:name=>"アクセサリー")
lady_hairaccessories = lady.children.create(:name=>"ヘアアクセサリー")
lady_smallarticles = lady.children.create(:name=>"小物")
lady_watchs = lady.children.create(:name=>"時計")

men_tops = men.children.create(:name=>"トップス")
men_jackets = men.children.create(:name=>"ジャケット/アウター")
men_pants = men.children.create(:name=>"パンツ")
men_shoes = men.children.create(:name=>"靴")
men_bags = men.children.create(:name=>"バッグ")
men_suits = men.children.create(:name=>"スーツ")
men_caps = men.children.create(:name=>"帽子")
men_accessories = men.children.create(:name=>"アクセサリー")
men_smallarticles = men.children.create(:name=>"小物")
men_watchs = men.children.create(:name=>"時計")
men_swimwears = men.children.create(:name=>"水着")
men_legwears = men.children.create(:name=>"レッグウェア")
men_underwears = men.children.create(:name=>"アンダーウェア")
men_others = men.children.create(:name=>"その他")

baby_girl95 = baby.children.create(:name=>"ベビー服(女の子用)~95cm")
baby_boy95 = baby.children.create(:name=>"ベビー服(男の子用)~95cm")
baby_common95 = baby.children.create(:name=>"ベビー服(男女兼用)~95cm")
baby_girl100 = baby.children.create(:name=>"ベビー服(女の子用)~100cm")
baby_boy100 = baby.children.create(:name=>"ベビー服(男の子用)~100cm")
baby_common100 = baby.children.create(:name=>"ベビー服(男女兼用)~100cm")
baby_shoes = baby.children.create(:name=>"キッズ靴")
baby_fashions = baby.children.create(:name=>"子ども用ファッション小物")
baby_omutsus = baby.children.create(:name=>"オムツ/トイレ/バス")
baby_outdoors = baby.children.create(:name=>"外出/移動用品")
baby_meals = baby.children.create(:name=>"授乳/食事")
baby_houses = baby.children.create(:name=>"ベビー家具/寝具/室内用品")
baby_toys = baby.children.create(:name=>"おもちゃ")
baby_events = baby.children.create(:name=>"行事/記念品")

# 孫要素

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"シャツ/ブラウス(半袖/袖なし)"},{:name=>"シャツ/ブラウス(七分/長袖)"},{:name=>"ポロシャツ"},{:name=>"キャミソール"},{:name=>"タンクトップ"},{:name=>"ホルターネック"},{:name=>"ニット/セーター"},{:name=>"チュニック"},{:name=>"カーディガン/ボレロ"},{:name=>"アンサンブル"},{:name=>"ベスト/ジレ"},{:name=>"パーカー"}])
lady_jackets.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"},{:name=>"Gジャン/デニムジャケット"},{:name=>"レザージャケット"},{:name=>"ダウンジャケット"},{:name=>"ライダースジャケット"},{:name=>"ミリタリージャケット"},{:name=>"ダウンベスト"},{:name=>"ジャンパー/ブルゾン"},{:name=>"ポンチョ"},{:name=>"ロングコート"},{:name=>"トレンチコート"},{:name=>"ダッフルコート"},{:name=>"ピーコート"}])
lady_pants.children.create([{:name=>"デニム/ジーンズ"}, {:name=>"ショートパンツ"},{:name=>"カジュアルパンツ"},{:name=>"ハーフパンツ"},{:name=>"チノパン"},{:name=>"ワークパンツ/カーゴパンツ"},{:name=>"クロップドパンツ"},{:name=>"サロペット/オーバーオール"},{:name=>"オールインワン"},{:name=>"サルエルパンツ"},{:name=>"ガウチョパンツ"},{:name=>"その他"}])
lady_skirts.children.create([{:name=>"ミニスカート"}, {:name=>"ひざ丈スカート"}, {:name=>"ロングスカート"}, {:name=>"キュロット"}, {:name=>"その他"}])
lady_onepieces.children.create([{:name=>"ミニワンピース"}, {:name=>"ひざ丈ワンピース"}, {:name=>"ロングワンピース"}, {:name=>"その他"}])
lady_shoes.children.create([{:name=>"ハイヒール/パンプス"}, {:name=>"ブーツ"},{:name=>"サンダル"},{:name=>"スニーカー"},{:name=>"ミュール"},{:name=>"モカシン"},{:name=>"ローファー/革靴"},{:name=>"フラットシューズ/バレエシューズ"},{:name=>"長靴/レインシューズ"},{:name=>"その他"}])
lady_pajamas.children.create([{:name=>"パジャマ"}, {:name=>"ルームウェア"}])
lady_legwears.children.create([{:name=>"ソックス"}, {:name=>"スパッツ/レギンス"}, {:name=>"ストッキング/タイツ"}, {:name=>"レッグウォーマー"}, {:name=>"その他"}])
lady_caps.children.create([{:name=>"ニットキャップ/ビーニー"}, {:name=>"ハット"}, {:name=>"ハンチング/ベレー帽"}, {:name=>"キャップ"}, {:name=>"キャスケット"}, {:name=>"麦わら帽子"}, {:name=>"その他"}])
lady_bags.children.create([{:name=>"ハンドバッグ"}, {:name=>"トートバッグ"},{:name=>"エコバッグ"},{:name=>"リュック/バックパック"},{:name=>"ボストンバッグ"},{:name=>"スポーツバッグ"},{:name=>"ショルダーバッグ"},{:name=>"クラッチバッグ"},{:name=>"ポーチ/バニティ"},{:name=>"ボディバッグ/ウェストバッグ"},{:name=>"マザーズバッグ"},{:name=>"メッセンジャーバッグ"},{:name=>"ビジネスバッグ"},{:name=>"旅行用バッグ/キャリーバッグ"}])
lady_accessories.children.create([{:name=>"ネックレス"}, {:name=>"ブレスレット"},{:name=>"バングル/リストバンド"},{:name=>"リング"},{:name=>"ピアス(片耳用)"},{:name=>"ピアス(両耳用)"},{:name=>"イヤリング"},{:name=>"アンクレット"},{:name=>"ブローチ/コサージュ"},{:name=>"チャーム"},{:name=>"その他"}])
lady_hairaccessories.children.create([{:name=>"ヘアゴム"}, {:name=>"ヘアバンド/カチューシャ"}, {:name=>"ヘアピン"}, {:name=>"その他"}])
lady_smallarticles.children.create([{:name=>"長財布"}, {:name=>"折り財布"},{:name=>"コインケース/小銭入れ"},{:name=>"名刺入れ/定期入れ"},{:name=>"キーケース"},{:name=>"キーホルダー"},{:name=>"手袋/アームカバー"},{:name=>"ハンカチ"},{:name=>"ベルト"},{:name=>"マフラー/ショール"},{:name=>"ストール/スヌード"},{:name=>"バンダナ/スカーフ"},{:name=>"ネックウォーマー"},{:name=>"サスペンダー"}])
lady_watchs.children.create([{:name=>"腕時計(アナログ)"}, {:name=>"腕時計(デジタル)"}, {:name=>"ラバーベルト"}, {:name=>"レザーベルト"}, {:name=>"金属ベルト"}, {:name=>"その他"}])

men_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"シャツ"},{:name=>"ポロシャツ"},{:name=>"タンクトップ"},{:name=>"ニット/セーター"},{:name=>"パーカー"},{:name=>"カーディガン"},{:name=>"スウェット"},{:name=>"ジャージ"},{:name=>"ベスト"},{:name=>"その他"}])
men_jackets.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"},{:name=>"Gジャン/デニムジャケット"},{:name=>"レザージャケット"},{:name=>"ダウンジャケット"},{:name=>"ライダースジャケット"},{:name=>"ミリタリージャケット"},{:name=>"ナイロンジャケット"},{:name=>"フライトジャケット"},{:name=>"ダッフルコート"},{:name=>"ピーコート"},{:name=>"ステンカラーコート"},{:name=>"トレンチコート"},{:name=>"モッズコート"}])
men_pants.children.create([{:name=>"デニム/ジーンズ"},{:name=>"ワークパンツ/カーゴパンツ"},{:name=>"スラックス"},{:name=>"チノパン"}, {:name=>"ショートパンツ"},{:name=>"ペインターパンツ"},{:name=>"サルエルパンツ"},{:name=>"オーバーオール"},{:name=>"その他"}])
men_shoes.children.create([{:name=>"スニーカー"},{:name=>"サンダル"},{:name=>"ブーツ"},{:name=>"モカシン"}, {:name=>"ドレス/ビジネス"},{:name=>"長靴/レインシューズ"},{:name=>"デッキシューズ"},{:name=>"その他"}])
men_bags.children.create([{:name=>"ショルダーバッグ"},{:name=>"トートバッグ"},{:name=>"ボストンバッグ"},{:name=>"ハンドバッグ"}, {:name=>"リュック/バックパック"},{:name=>"ウエストポーチ"},{:name=>"ボディーバッグ"},{:name=>"ドラムバッグ"},{:name=>"ビジネスバッグ"},{:name=>"トラベルバッグ"},{:name=>"メッセンジャーバッグ"},{:name=>"エコバッグ"},{:name=>"その他"}])
men_suits.children.create([{:name=>"スーツジャケット"}, {:name=>"スーツベスト"}, {:name=>"スラックス"}, {:name=>"セットアップ"},{:name=>"その他"}])
men_caps.children.create([{:name=>"キャップ"}, {:name=>"ハット"}, {:name=>"ニットキャップ/ビーニー"}, {:name=>"ハンチング/ベレー帽"}, {:name=>"キャスケット"}, {:name=>"サンバイザー"}, {:name=>"その他"}])
men_accessories.children.create([{:name=>"ネックレス"}, {:name=>"ブレスレット"},{:name=>"バングル/リストバンド"},{:name=>"リング"},{:name=>"ピアス(片耳用)"},{:name=>"ピアス(両耳用)"},{:name=>"アンクレット"},{:name=>"その他"}])
men_smallarticles.children.create([{:name=>"長財布"}, {:name=>"折り財布"},{:name=>"マネークリップ"},{:name=>"コインケース/小銭入れ"},{:name=>"名刺入れ/定期入れ"},{:name=>"キーケース"},{:name=>"キーホルダー"},{:name=>"ネクタイ"},{:name=>"手袋"},{:name=>"ハンカチ"},{:name=>"ベルト"},{:name=>"マフラー"},{:name=>"ストール"},{:name=>"バンダナ"}])
men_watchs.children.create([{:name=>"腕時計(アナログ)"}, {:name=>"腕時計(デジタル)"}, {:name=>"ラバーベルト"}, {:name=>"レザーベルト"}, {:name=>"金属ベルト"}, {:name=>"その他"}])
men_swimwears.children.create([{:name=>"一般水着"}, {:name=>"スポーツ用"}, {:name=>"アクセサリー"}, {:name=>"その他"}])
men_legwears.children.create([{:name=>"ソックス"}, {:name=>"レギンス/スパッツ"}, {:name=>"レッグウォーマー"}, {:name=>"その他"}])
men_underwears.children.create([{:name=>"トランクス"}, {:name=>"ボクサーパンツ"}, {:name=>"その他"}])

baby_girl95.children.create([{:name=>"トップス"}, {:name=>"アウター"},{:name=>"パンツ"},{:name=>"スカート"},{:name=>"ワンピース"},{:name=>"ベビードレス"},{:name=>"おくるみ"},{:name=>"下着/肌着"},{:name=>"パジャマ"},{:name=>"ロンパース"},{:name=>"その他"}])
baby_boy95.children.create([{:name=>"トップス"}, {:name=>"アウター"},{:name=>"パンツ"},{:name=>"おくるみ"},{:name=>"下着/肌着"},{:name=>"パジャマ"},{:name=>"ロンパース"},{:name=>"その他"}])
baby_common95.children.create([{:name=>"トップス"}, {:name=>"アウター"},{:name=>"パンツ"},{:name=>"おくるみ"},{:name=>"下着/肌着"},{:name=>"パジャマ"},{:name=>"ロンパース"},{:name=>"その他"}])
baby_girl100.children.create([{:name=>"コート"}, {:name=>"ジャケット/上着"},{:name=>"トップス(Tシャツ/カットソー)"},{:name=>"トップス(トレーナー)"},{:name=>"トップス(チュニック)"},{:name=>"トップス(タンクトップ)"},{:name=>"スカート"},{:name=>"パンツ"},{:name=>"ワンピース"},{:name=>"セットアップ"},{:name=>"パジャマ"},{:name=>"フォーマル/ドレス"},{:name=>"和服"}])
baby_boy100.children.create([{:name=>"コート"}, {:name=>"ジャケット/上着"},{:name=>"トップス(Tシャツ/カットソー)"},{:name=>"トップス(トレーナー)"},{:name=>"トップス(その他)"},{:name=>"パンツ"},{:name=>"セットアップ"},{:name=>"パジャマ"},{:name=>"フォーマル/ドレス"},{:name=>"和服"},{:name=>"浴衣"},{:name=>"甚平"},{:name=>"水着"},{:name=>"その他"}])
baby_common100.children.create([{:name=>"コート"}, {:name=>"ジャケット/上着"},{:name=>"トップス(Tシャツ/カットソー)"},{:name=>"トップス(トレーナー)"},{:name=>"トップス(その他)"},{:name=>"ボトムス"},{:name=>"パジャマ"},{:name=>"その他"}])
baby_shoes.children.create([{:name=>"スニーカー"}, {:name=>"サンダル"},{:name=>"ブーツ"},{:name=>"長靴"},{:name=>"その他"}])
baby_fashions.children.create([{:name=>"靴下/スパッツ"}, {:name=>"帽子"},{:name=>"エプロン"},{:name=>"サスペンダー"},{:name=>"タイツ"},{:name=>"ハンカチ"},{:name=>"バンダナ"},{:name=>"ベルト"},{:name=>"マフラー"},{:name=>"傘"},{:name=>"手袋"},{:name=>"スタイ"},{:name=>"バッグ"},{:name=>"その他"}])
baby_omutsus.children.create([{:name=>"おむつ用品"}, {:name=>"おまる/補助便座"},{:name=>"トレーニングパンツ"},{:name=>"ベビーバス"},{:name=>"お風呂用品"},{:name=>"その他"}])
baby_outdoors.children.create([{:name=>"ベビーカー"}, {:name=>"抱っこひも/スリング"},{:name=>"チャイルドシート"},{:name=>"その他"}])
baby_meals.children.create([{:name=>"ミルク"}, {:name=>"ベビーフード"},{:name=>"ベビー用食器"},{:name=>"その他"}])
baby_houses.children.create([{:name=>"ベッド"}, {:name=>"布団/毛布"},{:name=>"イス"},{:name=>"たんす"},{:name=>"その他"}])
baby_toys.children.create([{:name=>"おふろのおもちゃ"}, {:name=>"がらがら"},{:name=>"オルゴール"},{:name=>"ベビージム"},{:name=>"手押し車/カタカタ"},{:name=>"知育玩具"},{:name=>"その他"}])
baby_events.children.create([{:name=>"お宮参り用品"}, {:name=>"お食い初め用品"},{:name=>"アルバム"},{:name=>"手形/足形"},{:name=>"その他"}])
for i in 1..20
  Brand.create(name:"A#{i}")
end
User.create!(nickname:"Jhjh", birth_date:"1992-10-1",email:"kkk@gmail.com",password:"12345678",password_confirmation:"12345678",last_name:"田中",last_name_hira:"たなか",first_name:"真司", first_name_hira:"しんじ")
for i in 1..20
  Item.create!(user_id:1,category_id:300,brand_id:1,name:"Item#{i}",explannation:"説明#{i}",status:1,shipper:true,shipping_area:2,lead_time:2,price:1000,size:i,shipping_method:1)
end
for i in 1..20
  Image.create!(image: File.open("#{Rails.root}/public/images/pict/fashion_osyare_middle_man.png"), item_id:i)
end
