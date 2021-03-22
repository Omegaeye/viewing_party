class CreatePartyViewers < ActiveRecord::Migration[5.2]
  def change
    create_table :party_viewers do |t|
      t.references :party, foreign_key: true
      t.references :viewer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
