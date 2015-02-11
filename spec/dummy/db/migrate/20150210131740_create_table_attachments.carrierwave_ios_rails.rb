# This migration comes from carrierwave_ios_rails (originally 20150210103319)
class CreateTableAttachments < ActiveRecord::Migration
  def change
    create_table :carrierwave_ios_rails_attachments do |t|
      t.string :file

      t.timestamps
    end
  end
end
