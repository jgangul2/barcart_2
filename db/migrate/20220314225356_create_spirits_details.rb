class CreateSpiritsDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :spirits_details do |t|
      t.string :name

      t.timestamps
    end
  end
end
