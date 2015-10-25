json.array!(@rule_by_one_get_one_frees) do |rule_by_one_get_one_free|
  json.extract! rule_by_one_get_one_free, :id, :product_code
  json.url rule_by_one_get_one_free_url(rule_by_one_get_one_free, format: :json)
end
