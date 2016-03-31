json.array!(@delivery_plans) do |delivery_plan|
  json.extract! delivery_plan, :id, :order_id, :produce_task_ids, :number, :fin_type, :agency_fund, :delivery_date, :specify_logistic, :logistic_provider_id, :logistic_code
  json.url delivery_plan_url(delivery_plan, format: :json)
end
