class CreateUrlShorteners < ActiveRecord::Migration[5.2]
  def change
    create_table :url_shorteners do |t|
      t.string :url
      t.string :short

      t.timestamps
    end
  end
end
