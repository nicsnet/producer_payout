class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :producer_id
      t.string :title
    end
  end
end
