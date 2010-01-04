Then /^it lets it pass untouched$/ do
  @browser.last_response.should be_ok
  @browser.last_response.should =~ /Hello world!/
end

Then /^it responds with (\d\d\d)$/ do |code|
  @browser.last_response.status.should == code.to_i
end

Then /^the response body is empty$/ do
  @browser.last_response.body.should be_empty
end

Then /^there is no response$/ do
  lambda {@browser.last_response}.should raise_error(Rack::Test::Error)
end

Then /^an exception is climbing up the stack$/ do
  @exception.should_not be_nil
  @exception.should be_an_instance_of(Rack::Csrf::InvalidCsrfToken)
end
