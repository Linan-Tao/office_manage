# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
user.save!
puts 'CREATED ADMIN USER: ' << user.email

# 创建 供应商 初始化数据
Supplier.create(id: 1, name: '小胡供应', mobile: '15215211521', bank_account: '627001702381000001', address: '重庆市', note: '优质代理商')
Supplier.create(id: 2, name: '小李供应', mobile: '18618611861', bank_account: '627402709342020582', address: '成都市', note: '一级代理商')
Supplier.create(id: 3, name: '小杨供应', mobile: '18318311831', bank_account: '600807920384014023', address: '贵阳市', note: '普通代理商')
puts 'CREATED Supplier SUCCESS! '

# 创建 代理商、经销商 初始化数据
Agent.create(id: 1,code: '1000001',address: '湖北武汉', name: '小秦代理', principal: '王xx', mobile: '18610086121')
Agent.create(id: 2,code: '1000002',address: '贵州贵阳', name: '傣家代理', principal: '岳xx', mobile: '18610086122')
Agent.create(id: 3,code: '1000003',address: '河南郑州', name: '小孙代理', principal: '孙x', mobile: '18610086123')
puts 'CREATED Agent SUCCESS! '

# 创建 部件种类 初始化数据
PartCategory.create(id: 1, name:'拉篮')
PartCategory.create(id: 2, name:'滑轨')
PartCategory.create(id: 3, name:'角线')
puts 'CREATED PartCategory SUCCESS! '

# 创建 部件 初始化数据
Part.create(id: 1, part_category_id: 1, name: '100侧拉篮', buy: 100.00, sell: 110.00, number: 100, brand: '耐用牌', supplier_id: 1)
Part.create(id: 2, part_category_id: 1, name: '200侧拉篮', buy: 200.00, sell: 210.00, number: 50, brand: '坚固牌', supplier_id: 1)
Part.create(id: 3, part_category_id: 1, name: '400侧拉篮', buy: 300.00, sell: 310.00, number: 10, brand: '无敌牌', supplier_id: 3)
Part.create(id: 4, part_category_id: 2, name: '铜质滑轨', buy: 100.00, sell: 110.00, number: 50, brand: '耐用牌', supplier_id: 1)
Part.create(id: 5, part_category_id: 2, name: '铁质滑轨', buy: 200.00, sell: 210.00, number: 50, brand: '坚固牌', supplier_id: 2)
Part.create(id: 6, part_category_id: 2, name: '钢质滑轨', buy: 300.00, sell: 310.00, number: 10, brand: '无敌牌', supplier_id: 3)
Part.create(id: 7, part_category_id: 3, name: '普通角线', buy: 100.00, sell: 110.00, number: 100, brand: '耐用牌', supplier_id: 1)
Part.create(id: 8, part_category_id: 3, name: '高级角线', buy: 200.00, sell: 210.00, number: 50, brand: '坚固牌', supplier_id: 2)
Part.create(id: 9, part_category_id: 3, name: '特制角线', buy: 500.00, sell: 510.00, number: 10, brand: '无敌牌', supplier_id: 3)
puts 'CREATED Part SUCCESS! '

# 创建 部门 初始化数据
Department.create(id: 1, name: '财务部')
Department.create(id: 2, name: '仓储部')
Department.create(id: 3, name: '工艺部')
Department.create(id: 4, name: '后勤部')
puts 'CREATED Department SUCCESS! '

# 创建 板料种类 初始化数据
MaterialCategory.create(id: 1, oftype: 0, name:'3mm')
MaterialCategory.create(id: 2, oftype: 0, name:'5mm')
MaterialCategory.create(id: 3, oftype: 0, name:'15mm')
MaterialCategory.create(id: 4, oftype: 0, name:'16mm')
MaterialCategory.create(id: 5, oftype: 0, name:'17mm')
MaterialCategory.create(id: 6, oftype: 0, name:'18mm')
MaterialCategory.create(id: 7, oftype: 0, name:'25mm')
MaterialCategory.create(id: 8, oftype: 0, name:'36mm')
MaterialCategory.create(id: 9, oftype: 1, name:'颗粒板')
MaterialCategory.create(id: 10, oftype: 1, name:'密度板')
MaterialCategory.create(id: 11, oftype: 1, name:'多层板')
MaterialCategory.create(id: 12, oftype: 1, name:'生态板')
MaterialCategory.create(id: 13, oftype: 1, name:'实木板')
MaterialCategory.create(id: 14, oftype: 2, name:'光面')
MaterialCategory.create(id: 15, oftype: 2, name:'麻面')
MaterialCategory.create(id: 16, oftype: 2, name:'真木纹')
MaterialCategory.create(id: 17, oftype: 2, name:'浮雕面')
MaterialCategory.create(id: 18, oftype: 2, name:'同步纹')
MaterialCategory.create(id: 19, oftype: 3, name:'国色天香')
MaterialCategory.create(id: 20, oftype: 3, name:'一帘幽梦')
puts 'CREATED MaterialCategory SUCCESS! '


Material.create(id: 1, ply: 1, texture: 3, face: 5, color: 7, number: 50, buy: 100.00, sell: 110.00, code: '39fd6a', unit: '平方', supplier_id: 1);
Material.create(id: 2, ply: 1, texture: 3, face: 5, color: 8, number: 50, buy: 100.00, sell: 110.00, code: '39fd6b', unit: '平方', supplier_id: 1);
Material.create(id: 3, ply: 1, texture: 3, face: 6, color: 7, number: 50, buy: 100.00, sell: 110.00, code: '39fd6c', unit: '平方', supplier_id: 1);
Material.create(id: 4, ply: 1, texture: 3, face: 6, color: 8, number: 50, buy: 100.00, sell: 110.00, code: '39fd6d', unit: '平方', supplier_id: 1);
Material.create(id: 5, ply: 1, texture: 4, face: 5, color: 7, number: 50, buy: 100.00, sell: 110.00, code: '39fd6e', unit: '平方', supplier_id: 1);
Material.create(id: 6, ply: 1, texture: 4, face: 5, color: 8, number: 50, buy: 100.00, sell: 110.00, code: '39fd6f', unit: '平方', supplier_id: 1);
Material.create(id: 7, ply: 1, texture: 4, face: 6, color: 7, number: 50, buy: 100.00, sell: 110.00, code: '39fd6g', unit: '平方', supplier_id: 1);
Material.create(id: 8, ply: 1, texture: 4, face: 6, color: 8, number: 50, buy: 100.00, sell: 110.00, code: '39fd6h', unit: '平方', supplier_id: 1);
Material.create(id: 9, ply: 2, texture: 3, face: 5, color: 7, number: 50, buy: 100.00, sell: 110.00, code: '39fd6i', unit: '平方', supplier_id: 1);
Material.create(id: 10, ply: 2, texture: 3, face: 5, color: 8, number: 50, buy: 100.00, sell: 110.00, code: '39fd6j', unit: '平方', supplier_id: 1);
Material.create(id: 11, ply: 2, texture: 3, face: 6, color: 7, number: 50, buy: 100.00, sell: 110.00, code: '39fd6k', unit: '平方', supplier_id: 1);
Material.create(id: 12, ply: 2, texture: 3, face: 6, color: 8, number: 50, buy: 100.00, sell: 110.00, code: '39fd6l', unit: '平方', supplier_id: 1);
Material.create(id: 13, ply: 2, texture: 4, face: 5, color: 7, number: 50, buy: 100.00, sell: 110.00, code: '39fd6m', unit: '平方', supplier_id: 1);
Material.create(id: 14, ply: 2, texture: 4, face: 5, color: 8, number: 50, buy: 100.00, sell: 110.00, code: '39fd6n', unit: '平方', supplier_id: 1);
Material.create(id: 15, ply: 2, texture: 4, face: 6, color: 7, number: 50, buy: 100.00, sell: 110.00, code: '39fd6o', unit: '平方', supplier_id: 1);
Material.create(id: 16, ply: 2, texture: 4, face: 6, color: 8, number: 50, buy: 100.00, sell: 110.00, code: '39fd6p', unit: '平方', supplier_id: 1);
puts 'CREATED Material SUCCESS! '