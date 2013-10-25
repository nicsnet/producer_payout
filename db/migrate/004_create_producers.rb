class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :name
    end
  end
end
