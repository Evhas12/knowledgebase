class CreateSiteInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :site_infos do |t|
      t.string :brand_name
      t.string :seo_title
      t.text :seo_description
      t.text :header_scripts
      t.text :footer_scripts
      t.string :facebook_url
      t.string :github_url
      t.string :twitter_url

      t.timestamps
    end
  end
end
