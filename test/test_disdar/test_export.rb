require 'test/unit'
require 'webmock/test_unit'
require 'disdar'

class DisdarTest::ExportTest < Test::Unit::TestCase
  include ::TestSupport

  def test_resource_path
    assert_equal Disdar::Export.resource_path, "/exports"
  end

  def test_create_json_export
    result_url = "foo"
    stub_request( :post, api_url + "/exports" )
      .to_return( :body => {url: result_url}.to_json )

    export = Disdar::Export.create_json( "foo" )
    assert_equal export["url"], result_url
  end

  def test_create_excel_export
    result_url = "foo"
    stub_request( :post, api_url + "/exports" )
      .to_return( :body => {url: result_url}.to_json )

    export = Disdar::Export.create_excel( "foo" )
    assert_equal export["url"], result_url
  end

  def test_get_empty_export_list
    stub_request( :get, api_url + "/exports" )
      .to_return( :body => {"items" => []}.to_json )

    exports = Disdar::Export.list
    assert_equal exports, []
  end

  def test_get_export_list
    stub_request( :get, api_url + "/exports" )
      .to_return( :body => {"items" => [{uuid: 1}]}.to_json )

    exports = Disdar::Export.list
    assert_equal exports.count, 1
    assert_equal exports.first.uuid, 1
  end

  def test_get_export
    stub_request( :get, api_url + "/exports/1" )
      .to_return( :body => {uuid: 1}.to_json )

    export = Disdar::Export.get 1
    assert_equal export.uuid, 1
  end

  def test_delete_export
    stub_request( :delete, api_url + "/exports/1" )
      .to_return( :body => {success: true}.to_json )

    assert_equal Disdar::Export.delete( 1 ), {"success" => true}
  end

  def test_delete_method_on_exports
    stub_request( :get, api_url + "/exports" )
      .to_return( :body => {"items" => [{uuid: 1}]}.to_json )

    stub_request( :delete, api_url + "/exports/1" )
      .to_return( :body => {success: true}.to_json )

    exports = Disdar::Export.list
    assert_equal exports.first.delete, {"success" => true}
  end
end

