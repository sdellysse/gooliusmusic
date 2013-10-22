class CreateDiscs < ActiveRecord::Migration
  def change
    create_table :discs do |t|
      t.references :album, index: true
      t.integer :number

      t.timestamps
    end
  end
end
