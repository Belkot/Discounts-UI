json.array!(@rule_discount_if_one_by_mores) do |rule_discount_if_one_by_more|
  json.extract! rule_discount_if_one_by_more, :id, :product_code, :min_count, :discount
  json.url rule_discount_if_one_by_more_url(rule_discount_if_one_by_more, format: :json)
end
