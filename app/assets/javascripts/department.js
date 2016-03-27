$(document).ready(function() {
    $("#remoteDataExample").select2({
        placeholder: "查找用户",
        minimumInputLength: 1,
        ajax: {
            url: "/users.json",
            dataType: 'json',
            quietMillis: 300,
            data: function(search, page) {
                return {
                    term: search,
                    page_limit: 25,
                    page: page,
                };
            },
            results: function(data, page) {
                var more = (page * 10) < data.total;
                return {
                    results: data.users,
                    more: more
                };
            }
        },
        formatResult: function(user) {
            var markup = "<ul>";
            markup += "<li>" + user.name + "</li>";
            markup += "</ul>"
            return markup;
        },
        formatSelection: function(user) {
            return ("<input type='hidden' id='user_id' name='department[manager_id]' value=" + user.id + " />" + user.name);
        }
    }).select2("data", {
            "id": $("#remoteDataExample").data("id"),
            "name": $("#remoteDataExample").data("name")
        } //初始化数据
    );


    /* 订单到款 */
    $("#remoteOrder").select2({
        placeholder: "查找订单号",
        minimumInputLength: 1,
        ajax: {
            url: "/orders.json",
            dataType: 'json',
            quietMillis: 300,
            data: function(search, page) {
                return {
                    term: search,
                    page_limit: 25,
                    page: page,
                };
            },
            results: function(data, page) {
                var more = (page * 10) < data.total;
                return {
                    results: data.orders,
                    more: more
                };
            }
        },
        formatResult: function(order) {
            var markup = "<ul>";
            markup += "<li>" + order.order_code + "</li>";
            markup += "</ul>"
            return markup;
        },
        formatSelection: function(order) {
            return ("<input type='hidden' id='order_id' name='order[order_code]' value=" + order.id + " />" + order.order_code);
        }
    }).select2("data", {
        "id": $("#remoteOrder").data("id"),
        "order_code": $("#remoteOrder").data("name")
    }); //初始化数据
});