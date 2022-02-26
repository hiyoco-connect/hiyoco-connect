Ransack.configure do |config|
  # 生年月日を年齢として検索する。
  # xx歳以下
  config.add_predicate 'to_age_lteq',
    arel_predicate: 'gteq',
    formatter: -> (v) { ((v + 1).years.ago + 1.day).to_date },
    type: :integer,
    compounds: false
  # xx歳以上
  config.add_predicate 'to_age_gteq',
    arel_predicate: 'lteq',
    formatter: -> (v) { v.years.ago.to_date },
    type: :integer,
    compounds: false
end