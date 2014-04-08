require 'test/unit'
require 'webmock/test_unit'
require 'disdar'

class DisdarTest::UploadTest < Test::Unit::TestCase
  include ::TestSupport

  def test_resource_path
    assert_equal Disdar::Export.resource_path, "/uploads"
  end

  def test_create_upload
    filename = "foo"
    `touch #{filename}`
    stub_request( :post, api_url + "/uploads" )
      .to_return( :body => {name: filename}.to_json )

    upload = Disdar::Upload.create( filename )
    assert_equal upload.name, filename
    `rm #{filename}`
  end

  def test_get_empty_upload_list
    stub_request( :get, api_url + "/uploads" )
      .to_return( :body => {"items" => []}.to_json )

    uploads = Disdar::Upload.list
    assert_equal uploads, []
  end

  def test_get_upload_list
    stub_request( :get, api_url + "/uploads" )
      .to_return( :body => {"items" => [{uuid: 1}]}.to_json )

    uploads = Disdar::Upload.list
    assert_equal uploads.count, 1
    assert_equal uploads.first.uuid, 1
  end

  def test_get_upload
    stub_request( :get, api_url + "/uploads/1" )
      .to_return( :body => {uuid: 1}.to_json )

    upload = Disdar::Upload.get 1
    assert_equal upload.uuid, 1
  end

  def test_delete_upload
    stub_request( :delete, api_url + "/uploads/1" )
      .to_return( :body => {success: true}.to_json )

    assert_equal Disdar::Upload.delete( 1 ), {"success" => true}
  end

  def test_delete_method_on_uploads
    stub_request( :get, api_url + "/uploads" )
      .to_return( :body => {"items" => [{uuid: 1}]}.to_json )

    stub_request( :delete, api_url + "/uploads/1" )
      .to_return( :body => {success: true}.to_json )

    uploads = Disdar::Upload.list
    assert_equal uploads.first.delete, {"success" => true}
  end
end

