class CreateMyFiles < ActiveRecord::Migration
  create_table :my_files do |t|
      t.string :filename
      t.string :file_path
    end
end
