module Admin
  class RealEstatesController < Admin::BaseController

    crudify :real_estate,
            :title_attribute => 'title', :xhr_paging => true

  end
end
