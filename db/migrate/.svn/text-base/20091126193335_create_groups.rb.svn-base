class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :time
      t.string :ass
      t.references :party

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
