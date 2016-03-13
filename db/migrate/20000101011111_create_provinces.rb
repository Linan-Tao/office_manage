class CreateProvinces < ActiveRecord::Migration
  def change
    # 省
    create_table :provinces do |t|
      t.string :name
    end

    Province.create(:name => '北京')
    Province.create(:name => '天津')
    Province.create(:name => '河北')
    Province.create(:name => '山西')
    Province.create(:name => '内蒙古')
    Province.create(:name => '辽宁')
    Province.create(:name => '吉林')
    Province.create(:name => '黑龙江')
    Province.create(:name => '上海')
    Province.create(:name => '江苏')
    Province.create(:name => '浙江')
    Province.create(:name => '安徽')
    Province.create(:name => '福建')
    Province.create(:name => '江西')
    Province.create(:name => '山东')
    Province.create(:name => '河南')
    Province.create(:name => '湖北')
    Province.create(:name => '湖南')
    Province.create(:name => '广东')
    Province.create(:name => '广西')
    Province.create(:name => '海南')
    Province.create(:name => '重庆')
    Province.create(:name => '四川')
    Province.create(:name => '贵州')
    Province.create(:name => '云南')
    Province.create(:name => '西藏')
    Province.create(:name => '陕西')
    Province.create(:name => '甘肃')
    Province.create(:name => '青海')
    Province.create(:name => '宁夏')
    Province.create(:name => '新疆')
  end
end
