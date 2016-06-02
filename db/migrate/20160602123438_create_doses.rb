class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
