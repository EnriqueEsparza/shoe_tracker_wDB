class CreateClassTables < ActiveRecord::Migration
  def change
    create_table(:shoes) do |t|
      t.column(:brand, :string)

      t.timestamps
    end

    create_table(:stores) do |t|
      t.column(:name, :string)

      t.timestamps
    end
  end
end
