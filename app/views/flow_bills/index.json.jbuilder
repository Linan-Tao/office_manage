json.array!(@flow_bills) do |flow_bill|
  json.extract! flow_bill, :id, :bill_date, :customer, :total, :account, :note, :server_code, :order_code, :bill_code, :operator, :operate_date, :check_status, :check_date, :application_fund_id, :checker, :bill_type, :purchase_code
  json.url flow_bill_url(flow_bill, format: :json)
end
