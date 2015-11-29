class CreateAuditLogs < ActiveRecord::Migration
  def change
    create_table :audit_logs do |t|
      t.string :backtrace
      t.string :data
      t.references :user, index: true

      t.timestamps
    end
  end
end
