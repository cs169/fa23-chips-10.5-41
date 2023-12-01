class CreateCampaignFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_finances do |t|
      t.string :name
      t.integer :cycle
      t.decimal :category, precision: 10, scale: 2

      t.timestamps
    end
  end
end
