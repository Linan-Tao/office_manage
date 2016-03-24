/*
$(document).ready(function () {

  var municipalityId_array = ["1", "2", "9", "22"];
  var option_city = $("[id$='_city_id']").children();
  var option_district = $("[id$='_district_id']").children();
  var selectProId = null;
  var selectCityId = null;

  //alert(option_city[4].attributes["province_id"].value);
  //alert(option_city[4].outerHTML);
  $("[id$='_province_id']").click(function(){
    selectProId = $(this).val();
    $("[id$='_city_id']").empty();
    for (var i = 0; i <= option_city.length - 1; i++) {
      //筛选出上级行政单位id对应的城市
      if(selectProId == option_city[i].attributes["province_id"].value){
        //动态添加 城市下拉选项
        $("[id$='_city_id']").append(option_city[i].outerHTML);
        if($.inArray(selectProId, municipalityId_array) >= 0){
          $("[id$='_district_id']").empty();
          for (var j = 0; j <= option_district.length - 1; j++) {
            if(option_city[i].attributes["value"].value == option_district[j].attributes["city_id"].value){
              $("[id$='_district_id']").append(option_district[j].outerHTML);
            }
          };
        }

      }
    };
  });

  $("[id$='_city_id']").click(function(){
    selectCityId = $(this).val();
    $("[id$='_district_id']").empty();
    for (var i = 0; i <= option_district.length - 1; i++) {
      //筛选出上级行政单位id对应的城市
      if(selectCityId == option_district[i].attributes["city_id"].value){
        //动态添加 城市下拉选项
        $("[id$='_district_id']").append(option_district[i].outerHTML);
      }
    };
  });

});
*/