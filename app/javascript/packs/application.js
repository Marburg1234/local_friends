// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

import "../packs/map_index.js";
import "../packs/map_show.js";
import "../packs/map_region.js";
import "../packs/main_margin_top.js";
import "../packs/top_back.js";
import './valid_color';



Rails.start()
Turbolinks.start()
ActiveStorage.start()

