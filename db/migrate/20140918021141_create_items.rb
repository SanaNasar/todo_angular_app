class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :thing
      t.boolean :isDone, default: :false
      t.timestamps
    end
  end
end
