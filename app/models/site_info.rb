# == Schema Information
#
# Table name: site_infos
#
#  id              :integer          not null, primary key
#  brand_name      :string
#  seo_title       :string
#  seo_description :text
#  header_scripts  :text
#  footer_scripts  :text
#  facebook_url    :string
#  github_url      :string
#  twitter_url     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class SiteInfo < ApplicationRecord

  validates_with SiteInfoValidator, on: :create
  
end
