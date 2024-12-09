class CreatePartTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :part_types do |t|
      t.string :type_name

      t.timestamps
    end
  end
end
