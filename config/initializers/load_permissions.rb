Role.register_permission class: 'RolesController',
  name: '角色',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '查看' => [:show]
}

Role.register_permission class: 'DepartmentsController',
  name: '部门',
  actions: {
    '列表' => :index,
    '新建' => [:new, :create],
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '查看' => [:show]
}

Role.register_permission class: 'UsersController',
  name: '用户',
  actions: {
    '列表' => :index,
    '修改' => [:edit, :update],
    '删除' => [:destroy],
    '查看' => [:show]
}