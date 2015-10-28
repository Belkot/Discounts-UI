FactoryGirl.define do
  factory :rule_discount_if_one_by_more do
    product_code "MyRule"
    min_count 1
    discount 1.5
  end

end
