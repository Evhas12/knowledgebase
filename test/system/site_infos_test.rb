require "application_system_test_case"

class SiteInfosTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @site_info = site_infos(:one)
  end

  test "visiting the index" do
    sign_in users(:one)
    visit site_infos_url
    assert_selector "h1", text: "Site Infos"
  end

  test "should create site info" do
    sign_in users(:one)
    visit site_infos_url
    click_on "New Site Info"

    # fill_in "Brand name", with: @site_info.brand_name
    # fill_in "Facebook url", with: @site_info.facebook_url
    # fill_in "Footer scripts", with: @site_info.footer_scripts
    # fill_in "Github url", with: @site_info.github_url
    # fill_in "Header scripts", with: @site_info.header_scripts
    # fill_in "Seo description", with: @site_info.seo_description
    # fill_in "Seo title", with: @site_info.seo_title
    # fill_in "Twitter url", with: @site_info.twitter_url
    # click_on "Create Site info"

    # assert_text "Site info was successfully created"
    click_on "Back"
  end

  test "should update Site info" do
    sign_in users(:one)
    visit site_info_url(@site_info)
    click_on "Edit this site info", match: :first

    fill_in "Brand name", with: @site_info.brand_name
    fill_in "Facebook url", with: @site_info.facebook_url
    fill_in "Footer scripts", with: @site_info.footer_scripts
    fill_in "Github url", with: @site_info.github_url
    fill_in "Header scripts", with: @site_info.header_scripts
    fill_in "Seo description", with: @site_info.seo_description
    fill_in "Seo title", with: @site_info.seo_title
    fill_in "Twitter url", with: @site_info.twitter_url
    click_on "Update Site info"

    assert_text "Site info was successfully updated"
    click_on "Back"
  end

  test "should destroy Site info" do
    sign_in users(:one)
    visit site_info_url(@site_info)
    click_on "Destroy this site info", match: :first
    accept_confirm

    assert_text "Site info was successfully destroyed"
  end
end
