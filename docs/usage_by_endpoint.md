# Usage

## Mobile JSON Wire Protocol Endpoints

### GET /wd/hub/session/{sessionId}/context

```rb
driver.current_context
```

### POST /wd/hub/session/{sessionId}/context

```rb
driver.set_context 'NATIVE_APP'
```

### GET /wd/hub/session/{sessionId}/contexts

```rb
driver.available_contexts
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/pageIndex
Not implemented

### GET /wd/hub/session/{sessionId}/network_connection

```rb
driver.get_network
```

### POST /wd/hub/session/{sessionId}/network_connection

```rb
driver.set_network
```

### POST /wd/hub/session/{sessionId}/touch/perform

```rb
ta = Appium::Driver::TouchAction.new

ta.press x: 1000, y: 1000
ta.wait(1000)
ta.move_to x: 100, y: 1000
ta.release

perform(ta.actions)
```

### POST /wd/hub/session/{sessionId}/touch/multi/perform

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/receive_async_response
Not implemented



## Appium Extension Endpoints

### POST /wd/hub/session/{sessionId}/appium/device/shake

```rb
# TODO: test it
driver.shake
```

### POST /wd/hub/session/{sessionId}/appium/device/lock

```rb
driver.lock
```

### POST /wd/hub/session/{sessionId}/appium/device/unlock
Not implemented

### POST /wd/hub/session/{sessionId}/appium/device/is_locked

```rb
driver.device_locked?
```

### POST /wd/hub/session/{sessionId}/appium/start_recording_screen
Not implemented

### POST /wd/hub/session/{sessionId}/appium/stop_recording_screen
Not implemented

### POST /wd/hub/session/{sessionId}/appium/performanceData/types
Not implemented

### POST /wd/hub/session/{sessionId}/appium/getPerformanceData
Not implemented

### POST /wd/hub/session/{sessionId}/appium/device/press_keycode

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/appium/device/long_press_keycode

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/appium/device/keyevent

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/appium/device/rotate

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/appium/device/current_activity

```rb
driver.current_activity
```

### POST /wd/hub/session/{sessionId}/appium/device/install_app

```rb
# TODO: test it
driver.install_app app_path
```

### POST /wd/hub/session/{sessionId}/appium/device/remove_app

```rb
# TODO: fix it
```

### POST /wd/hub/session/{sessionId}/appium/device/app_installed?

```rb
driver.app_installed? 'com.vbanthia.androidsampleapp'
```

### POST /wd/hub/session/{sessionId}/appium/device/hide_keyboard

```rb
driver.hide_keyboard
```

### GET /wd/hub/session/{sessionId}/appium/device/is_keyboard_shown

```rb
driver.keyboard_shown?
```

### POST /wd/hub/session/{sessionId}/appium/device/push_file

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/appium/device/pull_file

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/appium/device/pull_folder

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/appium/device/toggle_airplane_mode

```rb
# TODO: test it
driver.toggle_airplane_mode
```

### POST /wd/hub/session/{sessionId}/appium/device/toggle_data
Not implemented

### POST /wd/hub/session/{sessionId}/appium/device/toggle_wifi
Not implemented

### POST /wd/hub/session/{sessionId}/appium/device/toggle_location_services
Not implemented

### POST /wd/hub/session/{sessionId}/appium/device/open_notifications

```rb
driver.open_notifications
```

### POST /wd/hub/session/{sessionId}/appium/device/start_activity

```rb
driver.start_activity(app_package = nil, app_activity = nil, app_wait_package = nil, app_wait_activity = nil)
```

### GET /wd/hub/session/{sessionId}/appium/device/system_bars

```rb
# TODO: test it
driver.system_bars
```

### GET /wd/hub/session/{sessionId}/appium/device/display_density

```rb
# TODO: test it
driver.display_density
```

### POST /wd/hub/session/{sessionId}/appium/simulator/toggle_touch_id_enrollment
Not implemented

### POST /wd/hub/session/{sessionId}/appium/simulator/touch_id
Not implemented

### POST /wd/hub/session/{sessionId}/appium/app/launch

```rb
driver.launch_app
```

### POST /wd/hub/session/{sessionId}/appium/app/close

```rb
driver.close_app
```

### POST /wd/hub/session/{sessionId}/appium/app/reset

```rb
# TODO: test it
driver.reset
```

### POST /wd/hub/session/{sessionId}/appium/app/background

```rb
driver.background_app 5
```

### POST /wd/hub/session/{sessionId}/appium/app/end_test_coverage
Not implemented

### POST /wd/hub/session/{sessionId}/appium/app/strings

```rb
driver.app_strings(language: 'en')
```

### POST /wd/hub/session/{sessionId}/appium/element/{elementId}/value

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/appium/element/{elementId}/replace_value

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/appium/settings
Not implemented

### POST /wd/hub/session/{sessionId}/appium/settings
Not implemented

### POST /wd/hub/session/{sessionId}/appium/receive_async_response
Not implemented


## Selenium WebDriver Endpoints

### POST /wd/hub/session

```rb
app_path = 'PATH/TO/APK'
caps = {
  app: app_path,
  deviceName: 'Android',
  newCommandTimeout: 999999
}

driver = Appium::Drvier.for(:uiautomator2, desired_capabilities: caps)
```

```rb
```

### GET /wd/hub/status

```rb
driver.remote_status
```

### GET /wd/hub/sessions

Not implemented

### GET /wd/hub/session/{sessionId}

```rb
driver.capabilities
```

### DELETE /wd/hub/session/{sessionId}

```rb
driver.quit
```

### POST /wd/hub/session/{sessionId}/timeouts

```rb
driver.manage.timeouts.page_load = 1
```

### POST /wd/hub/session/{sessionId}/timeouts/async_script

```rb
driver.manage.timeouts.script_timeout = 1
```

### POST /wd/hub/session/{sessionId}/timeouts/implicit_wait

```rb
driver.manage.timeouts.implicit_wait = 1
```

### POST /wd/hub/session/{sessionId}/url

```rb
driver.get 'http://google.com'
```

### POST /wd/hub/session/{sessionId}/forward

```rb
driver.navigate.forward
```

### POST /wd/hub/session/{sessionId}/back

```rb
driver.navigate.back
```

### POST /wd/hub/session/{sessionId}/refresh

```rb
driver.navigate.refresh
```

### POST /wd/hub/session/{sessionId}/execute

```rb
driver.execute_script(script, *args)
```

### POST /wd/hub/session/{sessionId}/execute_async

```rb
driver.execute_async_script(script, *args)
```

### POST /wd/hub/session/{sessionId}/screenshot

```rb
driver.save_screenshot(png_path)
driver.screenshot_as(format)
```

### GET /wd/hub/session/{sessionId}/ime/available_engines

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/ime/active_engine

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/ime/activated

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/ime/deactivate

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/ime/activate

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/frame

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/window

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/window/{windowhandle}/size

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/window/{windowhandle}/maximize

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/cookie

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/cookie

```rb
# TODO
```

### DELETE /wd/hub/session/{sessionId}/cookie

```rb
# TODO
```

### DELETE /wd/hub/session/{sessionId}/cookie/{name}

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/source

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/title

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/element

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/elements

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/element/active

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/element/{elementId}/element

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/element/{elementId}/elements

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/element/{elementId}/click

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/element/{elementId}/submit

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/text

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/element/{elementId}/value

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/keys

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/name

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/element/{elementId}/clear

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/selected

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/enabled

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/attribute/{name}

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/equals/{otherId}

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/displayed

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/location

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/location_in_view

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/size

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/element/{elementId}/css/{propertyName}

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/orientation

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/orientation

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/alert_text

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/alert_text

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/accept_alert

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/dismiss_alert

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/moveTo

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/click

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/touch/click

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/touch/down

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/touch/up

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/touch/move

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/touch/longClick

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/touch/flick

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/location

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/location

```rb
# TODO
```

### POST /wd/hub/session/{sessionId}/log

```rb
# TODO
```

### GET /wd/hub/session/{sessionId}/log/types

```rb
# TODO
```
