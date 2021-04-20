# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url(ENV['ROOT_URL'])

  section :menu, MenuSection, '#top-menu'
end
