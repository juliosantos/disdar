require 'test/unit'
require 'webmock/test_unit'
require 'disdar'

class DisdarTest < Test::Unit::TestCase
  BASIC_AUTH = "#{nil}:#{ENV["DISDAR_API_KEY"]}"
  def test_get_empty_document_list
    stub_request( :get, "http://#{BASIC_AUTH}@api.disdar.com/documents" )
      .to_return( :body => {"items" => []}.to_json )

    documents = Disdar::Document.list
    assert_equal documents, []
  end

  def test_get_document_list
    stub_request( :get, "http://#{BASIC_AUTH}@api.disdar.com/documents" )
      .to_return( :body => {"items" => [{uuid: 1}]}.to_json )

    documents = Disdar::Document.list
    assert_equal documents.count, 1
    assert_equal documents.first.uuid, 1
  end

  def test_get_document
    stub_request( :get, /http:\/\/#{BASIC_AUTH}@api\.disdar\.com\/documents\/\d+/ )
      .to_return( :body => {uuid: 1}.to_json )

    document = Disdar::Document.get 1
    assert_equal document.uuid, 1
  end

  def test_delete_document
    stub_request( :delete, /http:\/\/#{BASIC_AUTH}@api\.disdar\.com\/documents\/\d+/ )
      .to_return( :body => {success: true}.to_json )

    assert_equal Disdar::Document.delete( 1 ), {"success" => true}
  end

  def test_delete_method_on_documents
    stub_request( :get, "http://#{BASIC_AUTH}@api.disdar.com/documents" )
      .to_return( :body => {"items" => [{uuid: 1}]}.to_json )

    stub_request( :delete, /http:\/\/#{BASIC_AUTH}@api\.disdar\.com\/documents\/\d+/ )
      .to_return( :body => {success: true}.to_json )

    documents = Disdar::Document.list
    assert_equal documents.first.delete, {"success" => true}
  end

  def test_results_on_documents
    stub_request( :get, "http://#{BASIC_AUTH}@api.disdar.com/documents" )
      .to_return( :body => {"items" => [{uuid: 1, resultUrl: "http://results"}]}.to_json )

    stub_request( :get, "http://results" )
      .to_return( :body => {"results" => [{foo: "bar"}]}.to_json )

    documents = Disdar::Document.list
    assert_equal documents.first.results, {"results" => [{"foo" => "bar"}]}
  end
end

