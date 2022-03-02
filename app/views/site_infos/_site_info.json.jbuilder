json.extract! site_info, :id, :brand_name, :seo_title, :seo_description, :header_scripts, :footer_scripts, :facebook_url, :github_url, :twitter_url, :created_at, :updated_at
json.url site_info_url(site_info, format: :json)
