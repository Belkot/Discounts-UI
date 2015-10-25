class CreateRuleByOneGetOneFrees < ActiveRecord::Migration
  def change
    create_table :rule_by_one_get_one_frees do |t|
      t.string :product_code

      t.timestamps null: false
    end
  end
end
