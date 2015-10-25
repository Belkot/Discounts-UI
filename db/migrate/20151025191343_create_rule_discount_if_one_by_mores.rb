class CreateRuleDiscountIfOneByMores < ActiveRecord::Migration
  def change
    create_table :rule_discount_if_one_by_mores do |t|
      t.string :product_code
      t.integer :min_count
      t.float :discount

      t.timestamps null: false
    end
  end
end
