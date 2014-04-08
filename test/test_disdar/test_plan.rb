require 'test/unit'
require 'webmock/test_unit'
require 'disdar'

class DisdarTest::PlanTest < Test::Unit::TestCase
  include ::TestSupport

  def test_resource_path
    assert_equal Disdar::Plan.resource_path, "/plans"
  end

  def test_get_plan_list
    stub_request( :get, api_url + "/plans" )
      .to_return( :body => {"items" => [{uuid: 1}]}.to_json )

    plans = Disdar::Plan.list
    assert_equal plans.count, 1
    assert_equal plans.first.uuid, 1
  end

  def test_get_plan
    stub_request( :get, api_url + "/plans/1" )
      .to_return( :body => {uuid: 1}.to_json )

    plan = Disdar::Plan.get 1
    assert_equal plan.uuid, 1
  end

  def test_delete_plan_must_fail
    assert_raise RuntimeError do
      Disdar::Plan.delete 1
    end

    assert_raise RuntimeError do
      d = Disdar::Plan.new
      d.delete
    end
  end
end

