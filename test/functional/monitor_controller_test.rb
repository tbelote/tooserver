require File.dirname(__FILE__) + '/../test_helper'
require 'monitor_controller'

# Re-raise errors caught by the controller.
class MonitorController; def rescue_action(e) raise e end; end

class MonitorControllerTest < Test::Unit::TestCase
  def setup
    @controller = MonitorController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
