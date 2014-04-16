class CreateIQHomes < ActiveRecord::Migration
  def self.up
    create_table :iq_homes do |t|
      t.string :sensor
      t.string :sensor_adr
      t.string :aktor
      t.string :aktor_adr
      t.string :func

      t.timestamps
    end
  end

  def self.down
    drop_table :iq_homes
  end
end
