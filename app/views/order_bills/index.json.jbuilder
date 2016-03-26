json.array!(@order_bills) do |order_bill|
  json.extract! order_bill, :id, :order_id, :total, :paid, :left, :pay_date, :pay_account, :directive, :user_id, :delivery_date
  json.url order_bill_url(order_bill, format: :json)
end
