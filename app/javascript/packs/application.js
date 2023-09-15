import * as Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import 'popper.js'
import "bootstrap"
import "../src/application"

Rails.start()
ActiveStorage.start()

