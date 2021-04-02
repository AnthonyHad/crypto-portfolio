require "test_helper"

Webdrivers::Chromedriver.update

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include CapybaraSelect2
  include CapybaraSelect2::Helpers
  driven_by :headless_chrome
end
