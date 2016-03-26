json.array!(@application_funds) do |application_fund|
  json.extract! application_fund, :id, :fund_type, :name
  json.url application_fund_url(application_fund, format: :json)
end
