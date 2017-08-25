class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.string :date
      t.string :sponsor
      t.string :current_status
      t.string :content

      t.timestamps
    end
  end
end
