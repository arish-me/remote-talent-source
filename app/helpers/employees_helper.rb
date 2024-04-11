# frozen_string_literal: true

module EmployeesHelper
  def primary_roles_grouped
    categories = Category.includes(:primary_roles)
    grouped_options = []

    categories.each do |category|
      primary_roles = category.primary_roles.map { |role| { value: role.id, label: role.name.titleize } }

      grouped_options << { label: category.name.titleize, choices: primary_roles }
    end

    #  data = [{:label=>"Analyst",
    # :choices=>
    #  [{:value=>"16c6f878-2d56-4f1c-a2be-c89203ac2ba7", :label=>"Data Analyst"},
    #   {:value=>"543094fd-baa4-4ef9-8dfa-3cb854306405", :label=>"Financial Analyst"},
    #   {:value=>"e05955ce-df1d-40f4-9590-c40eed802944", :label=>"Market Analyst"},
    #   {:value=>"8c661386-7d59-488d-b061-93a6a2b70e4e", :label=>"Business Analyst"},
    #   {:value=>"e6898255-d2e8-474a-90af-4d90e2221ec0", :label=>"Operations Analyst"},
    #   {:value=>"da9de9cd-026c-4117-861f-851ebae4d4b3", :label=>"Systems Analyst"},
    #   {:value=>"e024f4fd-52bc-4627-bfc8-b1b4c937d022", :label=>"Research Analyst"}]}]

    grouped_options.map do |category|
      [category[:label], category[:choices].map { |choice| [choice[:label], choice[:value]] }]
    end
  end
end
