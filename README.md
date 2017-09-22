# Appium::Driver (Work In Progress)

## Installation

```sh
git clone git@github.com:vbanthia/appium_driver_ruby.git
bundle install

# Install appium
npm install
```

## Run appium server

```sh
./node_modules/.bin/appium --session-override
```

## Usages
```rb
require 'appium_driver'

app_path = File.join(File.expand_path(File.dirname(__FILE__)), 'debug','test_app.apk')

caps = {
  app: app_path,
  deviceName: 'Android',
  newCommandTimeout: 999999
}

driver = Appium::Driver.for(:uiautomator2, desired_capabilities: caps)

## Playing with test_app
driver.find_element(:id, 'inputFieldLeft').send_keys('10')
driver.find_element(:id, 'inputFieldRight').send_keys('15')
driver.find_element(:id, 'additionButton').click
```
