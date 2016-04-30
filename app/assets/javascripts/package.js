function remove_order (row) {
  if($(row).parent().parent().attr("id") == "old_table"){
    $("#new_table").append(row);  
  }else{
    $("#old_table").append(row);  
  }
}

function next(){
  var old_table = $("#old_table").find("tbody").html().trim();

  var current_index = parseInt(localStorage.getItem("index"));
  var val = $("#new_table").find("tbody").html();
  var pack = {};
  if(localStorage.getItem("pack")){
    pack = JSON.parse(localStorage.getItem("pack"));
  }

  if(val){
    pack[current_index] = val;
    localStorage.setItem("pack", JSON.stringify(pack));

    if(old_table != "" || pack[current_index+1]){
      localStorage.setItem("index", current_index+1);
      $("#new_table").find("tbody").empty();
      if(pack[current_index+1]){
        $("#new_table").find("tbody").html(pack[current_index+1]);
      } 
    }else{
      alert('没有下一包了');
    }
  }else{
    alert('请先选择当前包装的部件!');
  }




  // tr = $("#new_table").find("tbody").find('tr');
  // for(var i=0; i<tr.length; i++){
  //   var td = $(tr[i]).find('td').last().text();
  //   pack.push(td);
  // }
  // localStorage.setItem(time, pack);
  
  
}

function previous(){
  var current_index = parseInt(localStorage.getItem("index"));
  var val = $("#new_table").find("tbody").html();
  var pack = JSON.parse(localStorage.getItem("pack"));
  if( pack && pack[current_index-1]){
    pack[current_index] = val;
    localStorage.setItem("pack", JSON.stringify(pack));
    $("#new_table").find("tbody").empty();
    localStorage.setItem("index", current_index-1);
    $("#new_table").find("tbody").html(pack[current_index-1]);
  }else{
    alert('没有上一包了。');
  }

}

function print_page(){
  var old_table = $("#old_table").find("tbody").html().trim();

  if(old_table != ''){
    alert('您还没有拆分完所有包装，请继续选择完再进行批量打印');
  }else{
    var pack = JSON.parse(localStorage.getItem("pack"));
    var current_index = parseInt(localStorage.getItem("index"));
    var val = $("#new_table").find("tbody").html();
    if(!pack[current_index]){
      pack[current_index] = val;
      localStorage.setItem("pack", JSON.stringify(pack));
    }
    window.print();
  }
}