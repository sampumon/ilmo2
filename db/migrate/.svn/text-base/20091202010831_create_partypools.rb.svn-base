class CreatePartypools < ActiveRecord::Migration
  def self.up
    create_table :partypools do |t|
      t.references :group
      t.references :user
      t.references :party # the famous normal-form breakage!
            
      t.timestamps
    end
  end

  def self.down
    drop_table :partypools
  end
end
