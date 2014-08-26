(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(function(require, exports, module) {
    var $, SectionNav;
    $ = require('jquery');
    SectionNav = (function() {
      SectionNav.ACTIVE_CLASS = 'active';

      function SectionNav(target) {
        this.target = target;
        this.onHashChange = __bind(this.onHashChange, this);
        this.nav = this.target.find('nav .sections');
        this.sections = this.target.children('section');
        $(window).on('hashchange', this.onHashChange);
        if (window.location.pathname !== '') {
          this.onHashChange();
        }
      }

      SectionNav.prototype.navigateTo = function(sectionName) {
        if (sectionName === '') {
          return;
        }
        this.sections.removeClass(SectionNav.ACTIVE_CLASS);
        this.target.children("." + sectionName).addClass(SectionNav.ACTIVE_CLASS);
        this.nav.children().removeClass(SectionNav.ACTIVE_CLASS);
        this.nav.find("." + sectionName).addClass(SectionNav.ACTIVE_CLASS);
        return this.selected = sectionName;
      };

      SectionNav.prototype.onHashChange = function() {
        var section;
        section = window.location.hash.slice(1);
        this.navigateTo(section);
        return $(window).scrollTop(0);
      };

      return SectionNav;

    })();
    return $(function() {
      var $page, nav;
      $page = $('.index-page');
      return nav = new SectionNav($page);
    });
  });

  require(['main']);

}).call(this);
