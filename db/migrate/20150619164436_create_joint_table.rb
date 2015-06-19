class CreateJointTable < ActiveRecord::Migration
  def change

    create_table(:shoes_stores) do |t|
      t.belongs_to(:shoe)
      t.belongs_to(:store)

      t.timestamps()
    end

  end
end
