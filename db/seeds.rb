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
  User.new(mobile: "13699236168", email: "cming.xu@gmail.com", password: "cming.xu@gmail.com", roles: ["admin"]).save
rescue  Error => e
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






