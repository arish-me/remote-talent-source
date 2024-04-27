# frozen_string_literal: true

module Admin
  # services/admin/global_service.rb
  class GlobalService
    include Admin::SeedConstant

    def call
      create_categories
      create_primary_roles
      create_skills
      create_role_types
      create_role_levels
      create_industries
      create_specialities
    end

    def create_categories
      CATEGORIES.each do |category_name|
        Category.find_or_create_by(name: category_name)
      end
    end

    def create_primary_roles
      Category.all.each do |category|
        PRIMARY_ROLES[category.name].each do |primary_role_name|
          category.primary_roles.find_or_create_by(name: primary_role_name)
        end
      end

      def create_skills
        Category.all.each do |category|
          SKILLS[category.name].each do |skill|
            category.skills.find_or_create_by(name: skill)
          end
        end
      end

      def create_role_types
        ROLE_TYPES.each do |role_type|
          RoleType.find_or_create_by(name: role_type)
        end
      end

      def create_role_levels
        ROLE_LEVEL.each do |role_type|
          RoleLevel.find_or_create_by(name: role_type)
        end
      end

      def create_industries
        INDUSTRY_OPTIONS.each do |industry|
          Industry.find_or_create_by(name: industry)
        end
      end

      def create_specialities
        SPECIALITY_OPTIONS.each do |speciality|
          Speciality.find_or_create_by(name: speciality)
        end
      end
    end
  end
end
