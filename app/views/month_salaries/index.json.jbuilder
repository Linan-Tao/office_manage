json.array!(@month_salaries) do |month_salary|
  json.extract! month_salary, :id, :user_id, :name, :total, :extra, :add, :cut, :bonus, :old_age_insurance, :medicare_insurance, :unemployed_insurance, :house_fund, :pre_tax, :income_tax, :actual
  json.url month_salary_url(month_salary, format: :json)
end
