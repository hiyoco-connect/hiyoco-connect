MAX_GRADE = 30 # 期の最大値
PREFECTURES_COUNT = 47 # 都道府県の数

for id in 1..100 do
  User.seed_once(
    {
      id: id,
      email: "init_user#{id}@example.com"
    }
  )

  GRADE = (id % MAX_GRADE) + 1
  PREFECTURE_CODE = (id % PREFECTURES_COUNT) + 1
  Profile.seed_once(
    id: id,
    user: User.find(id),
    grade: GRADE,
    name: Faker::Games::Pokemon.name,
    self_introduce: Faker::Games::Pokemon.location,
    hobby: Faker::Games::Pokemon.move,
    gender: id % Profile.genders.length,
    birthplace_code: PREFECTURE_CODE,
    living_place_code: PREFECTURE_CODE,
    date_of_birth: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'),
    blood_type: id % Profile.blood_types.length,
    siblings_relation: id % Profile.siblings_relations.length,
    times_name: "times_#{GRADE}期生_test",
    team_dev_will: id % Profile.team_dev_wills.length,
    twitter_account: 'test'
  )
end