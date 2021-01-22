# helpers.rb

module Helpers
  def setup_host
    if defined?(CONFIG_TEST_HOST)
      @test_host_env = CONFIG_TEST_HOST
    end
    if (@test_host_env == "dev")
      @base_url = "https://dev-www.nypl.org"
    end
    if (@test_host_env == "qa")
      @base_url = "https://qa-www.nypl.org"
    end
    if (@test_host_env == "prod")
      @base_url = "https://www.nypl.org"
    end
    if (@test_host_env == "d8prod")
      @base_url = "https://d8.nypl.org"
    end
    if (@test_host_env == "d8qa")
      @base_url = "https://qa-d8.nypl.org"
    end
  end

  def login_to_drupal_7_admin
    visit "#{@base_url}/user"
    fill_in "name", with: ENV["DRUPAL7_USER_NAME"]
    fill_in "pass", with: ENV["DRUPAL7_PASS"]
    click_button "op"
  end
end

# SCREENSHOTS_________________________________________________________
def setup_screenshots
  @screen_path = "screenshots"
  @screen_file = File.basename(caller[0]).chomp(File.extname(File.basename(caller[0])))
  @screen_time = Time.now.strftime("%Y%m%d_%H%M%S_%L")
  #@screen_host = "#{(defined?(CONFIG_TEST_HOST)) ? CONFIG_TEST_HOST : ENV['TEST_HOST']}"
  @screen_host = "nypl"
  @screen_path_file = @screen_path + "/" + @screen_host + "_" + @screen_file
  @screen_path_file_beta = @screen_path + "/"
  @screen_time_beta = Time.now.strftime("%H%M%S")
  @random = (0...3).map { (97 + rand(26)).chr }.join
end

def save_full_screenshot(sname)
  save_screenshot("#{sname}", :full => true)
end

def save_full_snap(sname, sformat)
  save_screenshot("#{@screen_path_file}_#{sname}_#{@screen_time}.#{sformat}", :full => true)
end

def save_snap(sname, sformat)
  save_screenshot("#{@screen_path_file}_#{sname}_#{@screen_time}.#{sformat}", :full => false)
end

def save_snap_beta(sname, sformat)
  save_screenshot("#{@screen_path_file_beta}#{@screen_time_beta}_#{sname}.#{sformat}", :full => true)
end