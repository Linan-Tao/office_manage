Role.register_permission class: 'AgentsController',
  name: '代理商',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'ApplicationFundsController',
  name: '资金项目',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'DeliveryPlansController',
  name: '出货计划',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'DepartmentsController',
  name: '部门',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy]
}
Role.register_permission class: 'DriversController',
  name: '司机',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'EstatesController',
  name: '固定资产',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'FlowBillsController',
  name: '流水账',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'InstalersController',
  name: '安装工人',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'ItemStoragesController',
  name: '入库记录',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'LogisticProvidersController',
  name: '物流商',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'MaterialCategoriesController',
  name: '板料种类',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'MaterialTypesController',
  name: '板料类型',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'MaterialsController',
  name: '板料',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'MixTasksController',
  name: '混单',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'MonthSalariesController',
  name: '工资',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'OffersController',
  name: '报价单',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'OrderBillsController',
  name: '订单到款',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'OrderPartsController',
  name: '配件',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}

Role.register_permission class: 'OrderUnitsController',
  name: '部件',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'OrdersController',
  name: '订单',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'OutStoragesController',
  name: '出库记录',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'PartCategoriesController',
  name: '部件种类',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'PartsController',
  name: '部件',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'ProduceTasksController',
  name: '生产任务',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'ProducesController',
  name: '生产',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'ProductsController',
  name: 'Products',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'PurchasesController',
  name: '采购单',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'RolesController',
  name: '角色',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy]
}
Role.register_permission class: 'StaffsController',
  name: '员工信息',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'SuppliersController',
  name: '供应商',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}
Role.register_permission class: 'UsersController',
  name: '用户',
  actions: {
    '列表' => :index,
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '详细' => [:show]
}