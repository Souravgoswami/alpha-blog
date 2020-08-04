require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'jquery'
import 'bootstrap'
import '../stylesheets/application.scss'

document.addEventListener('turbolinks:load', () => {
	$('[data-toggle="tooltip"]').tooltip({
		trigger: 'hover'
	}).click(function() { $(this).tooltip('hide') })
})
