# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  $('#products').dataTable
    processing: true
    serverSide: true
    pageLength: 5
    lengthMenu: [5, 25, 50, 100]
    ajax: "/products.json"
