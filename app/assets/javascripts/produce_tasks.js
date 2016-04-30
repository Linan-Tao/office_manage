//全选和反选
function CheckSelect(){
  var check_boxes = $('.checkbox');
  for ( var i = 0; i < check_boxes.length; i++)  
  {  
    // 提取控件  
    var checkbox = check_boxes[i];  
    // 检查是否是指定的控件  
    if (checkbox.checked === false)  
    {  
      // 正选  
      checkbox.checked = true;  
    }  
    else if (checkbox.checked === true)  
    {  
      // 反选  
      checkbox.checked = false;  
    }
  }  
}