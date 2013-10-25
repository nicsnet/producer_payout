class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.decimal :price, precision: 12, scale: 3
    end
  end
end
