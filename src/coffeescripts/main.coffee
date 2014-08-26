# Entry point for client-side app
define (require, exports, module) ->

  $ = require 'jquery'

  # Navigation to hide / show sections on index page
  class SectionNav
    @ACTIVE_CLASS: 'active'

    constructor: (@target) ->
      @nav      = @target.find 'nav .sections'
      @sections = @target.children 'section'
      $(window).on 'hashchange', @onHashChange

      if window.location.pathname isnt ''
        @onHashChange()

    navigateTo: (sectionName) ->
      return if sectionName is ''

      @sections.removeClass SectionNav.ACTIVE_CLASS
      @target.children(".#{sectionName}").addClass SectionNav.ACTIVE_CLASS

      @nav.children().removeClass SectionNav.ACTIVE_CLASS
      @nav.find(".#{sectionName}").addClass SectionNav.ACTIVE_CLASS

      @selected = sectionName

    onHashChange: =>
      section = window.location.hash.slice(1)
      @navigateTo section
      $(window).scrollTop(0)

  # DOM Ready ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  $ ->
    $page = $('.index-page')
    nav   = new SectionNav($page)

# We need to actually require 'main' for it to load
require ['main']
