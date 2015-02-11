class CreateTableAttachments < ActiveRecord::Migration
  def change
    create_table :carrierwave_ios_rails_attachments do |t|
      t.string :file

      t.timestamps
    end
  end
end
