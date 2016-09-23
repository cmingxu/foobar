# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

begin
  User.delete_all
  Category.delete_all
  ConditionValue.delete_all
  Condition.delete_all
  User.new(mobile: "13699236168", password: "13699236168", roles: ["admin"]).save
rescue  Exception => e
  puts e

end

%w(主板 显卡 CPU 内存 硬盘 机箱 电源 散热器 固态硬盘 光驱 声卡).each do |f|
  Category.create name: f
end


cpu  = Category.find_by(name: "CPU")
%w(品牌 价格 CPU系列 适用类型 核心数量 插槽类型 核心代号).each do |c|
  Condition.create name: c, category: cpu
end

brand  = Condition.find_by(name: "品牌")
%w(Intel AMD).each do |c|
  ConditionValue.create name: c, condition: brand, category: cpu
end


serial = Condition.find_by(name: "CPU系列")
%w(酷睿i7 酷睿i5 酷睿i3 奔腾 凌动 APU 推土机FX 羿龙II 速龙II).each do |c|
  ConditionValue.create name: c, condition: serial, category: cpu
end

code = Condition.find_by(name: "核心代号")
%w( SkyLake Broadwell Haswell Ivy Bridge Sandy Bridge Richland Trinity Zambezi Llano).each do |c|
  ConditionValue.create name: c, condition: code, category: cpu
end

100.times do |i|
  category = Category.order("rand()").first
  attrs = { name: Faker.name,
            count: rand(1000),
            category: category,
            user_id: User.first.id
  }

  a = Accessory.new attrs
  a.conditions = Condition.all.shuffle[0..2]
  cvs = a.conditions.map do |c|
    c.condition_values.shuffle.first
  end.compact
  a.condition_values = cvs
  a.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  a.save
end






