// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ReactController from "./react_controller"
import NestedForm from 'stimulus-rails-nested-form'
import Select from "./select"

application.register("react", ReactController)
application.register('nested-form', NestedForm)
application.register('select', Select)

