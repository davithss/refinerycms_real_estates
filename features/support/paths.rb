module NavigationHelpers
  module Refinery
    module RealEstates
      def path_to(page_name)
        case page_name
        when /the list of real_estates/
          admin_real_estates_path

         when /the new real_estate form/
          new_admin_real_estate_path
        when /the list of categories/
          admin_categories_path

         when /the new category form/
          new_admin_category_path
        else
          nil
        end
      end
    end
  end
end
