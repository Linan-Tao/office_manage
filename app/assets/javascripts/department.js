$(document).ready(function() {
  $("#remoteDataExample").select2({
    placeholder: "Search user",
    minimumInputLength: 1,
    ajax: {
        url: "/users.json",
        dataType: 'json',
        quietMillis: 300,
        data: function (search, page) {
            return {
                term: search,
                page_limit: 25,
                page: page,
            };
        },
        results: function (data, page) {
        var more = (page * 10) < data.total;                
          return {results: data.users, more: more};
        }
    },
    formatResult: userFormatResult,
    formatSelection: userFormatSelection
  }).select2("data",
     {"id": $("#remoteDataExample").data("id"),"name":$("#remoteDataExample").data("name")}  //初始化数据
    );
});

function userFormatResult(user) {
    var markup = "<ul>";

    markup += "<li>" + user.name + "</li>";

    markup += "</ul>"
    return markup;
}

function userFormatSelection(user) {
    return ("<input type='hidden' id='user_id' name='department[manager_id]' value="+user.id+" />"+user.name);
}