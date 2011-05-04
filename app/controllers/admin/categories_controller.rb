module Admin
  class CategoriesController < Admin::BaseController

    crudify :category, :title_attribute => 'title', :xhr_paging => true

  end
end
