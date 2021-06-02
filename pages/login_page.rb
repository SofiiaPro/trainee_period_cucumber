class LoginPage

  def initialize(browser)
    @browser = browser
  end

  def get_username
    @browser.text_field(id: "username")
  end

  def get_password
    @browser.text_field(id: "password")
  end

  def get_login_button
    @browser.input(id: "loginButton")
  end

  def get_session_location
    @browser.li(text: "Outpatient Clinic")
  end

  def navigate_to_login_page
    @browser.goto "https://demo.openmrs.org/openmrs/login.htm"
  end

  def enter_username(arg)
    username = get_username
    username.set arg
  end

  def enter_password(arg)
    password = get_password
    password.set arg
  end

  def choose_location
    session_location = get_session_location
    session_location.click
  end

  def click_on_login_button
    login_button = get_login_button
    login_button.click
  end

  def compare_home_page_headers(text)
    page_output = @browser.element(text: "Logged in")
    page_output == text
  end
end
