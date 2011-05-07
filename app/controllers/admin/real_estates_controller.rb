module Admin
  class RealEstatesController < Admin::BaseController

    crudify :real_estate,
            :title_attribute => 'title', :xhr_paging => true
            
    before_filter :find_all_categories,
                  :only => [:new, :edit, :create, :update]

  protected
   def find_all_categories
       @real_estates_categories = Category.order('position ASC')
   end
  end
end
