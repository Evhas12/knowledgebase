require "test_helper"

class SiteInfosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @site_info = site_infos(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get site_infos_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_site_info_url
    assert_response :success
  end

  test "should create site_info" do
    sign_in users(:one)
    # assert_difference("SiteInfo.count") do
    #   post site_infos_url, params: { site_info: { brand_name: 'brandname', facebook_url: 'facebookurl', footer_scripts: 'footerscripts', github_url: 'github_url', header_scripts: 'header_scripts', seo_description: 'seo_description', seo_title: 'seo_title', twitter_url: 'twitter_url' } }
    #   assert_response unprocessable_entity: 422
    # end

    # assert_redirected_to site_info_url(SiteInfo.last)
  end

  test "should show site_info" do
    sign_in users(:one)
    get site_info_url(@site_info)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_site_info_url(@site_info)
    assert_response :success
  end

  test "should update site_info" do
    sign_in users(:one)
    patch site_info_url(@site_info), params: { site_info: { brand_name: @site_info.brand_name, facebook_url: @site_info.facebook_url, footer_scripts: @site_info.footer_scripts, github_url: @site_info.github_url, header_scripts: @site_info.header_scripts, seo_description: @site_info.seo_description, seo_title: @site_info.seo_title, twitter_url: @site_info.twitter_url } }
    assert_redirected_to site_info_url(@site_info)
  end

  test "should destroy site_info" do
    sign_in users(:one)
    assert_difference("SiteInfo.count", -1) do
      delete site_info_url(@site_info)
    end

    assert_redirected_to site_infos_url
  end
end
