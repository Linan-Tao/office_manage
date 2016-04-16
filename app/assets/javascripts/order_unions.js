// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(function(){
//   $("#exportOffer").click(function(){
//     $.ajax({
//       url: '/order_unions.json',
//       data: { id: $("#order_union_id").val()},
//       success: function(data){
//         alert("ajax成功！" + data[0].code);
//       }
//     });
//     // 阻塞 toggle 方法，防止弹出模态框
//     // 调用后台方法，判断所有子订单是否已拆单
//     // 如果有未拆单的子订单，提示并返回
//     // 否则，继续弹出
//   });

  // 打开外部拆单程序Excel
  $("#openOutExcel").click(function(){
    alert("所有程序均在服务器上运行，且JavaScript运行在浏览器的沙箱模式中。");
  });

  // 复制子订单号到系统粘贴板
  $("#orderCode").dblclick(function(){
    alert("子订单号："+$(this).text());
  });

  // 上传图纸
  $(".uploadOrderGraph").click(function(){
    alert("上传图纸");
  });

});