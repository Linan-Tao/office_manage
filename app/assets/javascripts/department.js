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
            markup += "<li>" + order.name + "</li>";
            markup += "</ul>"
            return markup;
        },
        formatSelection: function(order) {
            return ("<input type='hidden' id='order_id' name='order[name]' value=" + order.id + " />" + order.name);
        }
    }).select2("data", {
        "id": $("#remoteOrder").data("id"),
        "name": $("#remoteOrder").data("name")
    }); //初始化数据


    /* 领料出库 -- 领料人 */
    $("#remoteOutUser").select2({
        placeholder: "查找员工",
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
            return ("<input type='hidden' id='user_id' name='out_storage[out_user]' value=" + user.id + " />" + user.name);
        }
    }).select2("data", {
            "id": $("#remoteOutUser").data("id"),
            "name": $("#remoteOutUser").data("name")
    }); //初始化数据

});