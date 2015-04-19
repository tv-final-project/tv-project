class CreateShows < ActiveRecord::Migration
  def up
    create_table :shows do |t|
      t.string :name
    end
  end

  def down
    drop_table :shows
  end
end
