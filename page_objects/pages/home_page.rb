# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url('http://testautomate.me/redmine')

  section :menu, MenuSection, '#top-menu'
end
