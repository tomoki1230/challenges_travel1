plans = [
  {name: "沖縄旅行", price: 10000},
  {name: "北海道旅行", price: 20000},
  {name: "九州旅行", price: 15000}
]

FIRST_PLAN_NUM = 1
LAST_PLAN_NUM = (FIRST_PLAN_NUM + plans.size) - 1
DISCOUNT_STANDARD_VALUE = 5
DISCOUNT_RATE = 0.1
AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE

puts "旅行プランを選択して下さい。"
plans.each.with_index(FIRST_PLAN_NUM) do |plan,i|
  puts "#{i}. #{plan[:name]} (#{plan[:price]}円)"
end

while true
  print "プランの番号を選択 > "
  select_plan_num = gets.to_i
  break if (FIRST_PLAN_NUM..LAST_PLAN_NUM).include?(select_plan_num)
  puts "#{FIRST_PLAN_NUM}〜#{LAST_PLAN_NUM}の番号を入力して下さい。"
end

chosen_plan_index = select_plan_num - FIRST_PLAN_NUM
chosen_plan = plans[chosen_plan_index]

puts "#{chosen_plan[:name]}ですね。
何名で予約されますか？"
while true
  print "人数を入力 > "
  reserve_number_of_people = gets.to_i
  break if reserve_number_of_people >= 1
  puts "1以上を入力して下さい。"
end

puts "#{reserve_number_of_people}名ですね。"
total_price = chosen_plan[:price] * reserve_number_of_people
if reserve_number_of_people >= DISCOUNT_STANDARD_VALUE
  puts "#{DISCOUNT_STANDARD_VALUE}名以上ですので#{(DISCOUNT_RATE*100).floor}％割引となります"
  total_price *= AFTER_DISCOUNT_RATE
end

puts "合計料金は#{total_price.floor}円になります。"
