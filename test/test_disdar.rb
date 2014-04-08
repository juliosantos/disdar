require 'test/unit'
require 'webmock/test_unit'
require 'disdar'

class DisdarTest < Test::Unit::TestCase
  include ::TestSupport

  def test_call_api
    stub_request( :get, api_url + "/documents" )
      .to_return( :body => {"items" => [{uuid: 1}]}.to_json )

    documents = Disdar::Document.list
    assert_equal documents.count, 1
    assert_equal documents.first.uuid, 1
  end
end

