# frozen_string_literal: true

class JobQuery
  include Pagy::Backend

  alias build_pagy pagy
  attr_reader :options

  def initialize(options = {})
    @options = options
    @items_per_page = options.delete(:items_per_page)
    @sort = options.delete(:sort)
    @role_types = options.delete(:role_types)
    @preferred_locations = options.delete(:preferred_locations)
    @countries = options.delete(:countries)
    @search_query = options.delete(:search_query)
    # @countries = options.delete(:countries)

    # @specialty_ids = options.delete(:specialty_ids)
    # @countries = options.delete(:countries)
    # @categories = options.delete(:categories)
    # @utc_offsets = options.delete(:utc_offsets)

    # @role_levels = options.delete(:role_levels)
    # @badges = options.delete(:badges)
    # @include_not_interested = options.delete(:include_not_interested)
    # @search_query = options.delete(:search_query)
    @user = options.delete(:user)
  end

  def filters
    @filters = { sort:, role_types:, preferred_locations:, countries: }
  end

  def pagy
    @pagy ||= query_and_paginate.first
  end

  def records
    @records ||= query_and_paginate.last
  end

  def featured_records
    if pagy.page == 1 && empty_search?
      @featured_records ||= Developer.featured
    else
      Developer.none
    end
  end

  def sort
    @sort.to_s.downcase.to_sym == :newest ? :newest : :mostviewed
  end

  def countries
    @countries.to_a.reject(&:blank?).map(&:to_sym)
  end

  def role_types
    @role_types.to_a.reject(&:blank?).map(&:to_sym)
  end

  def preferred_locations
    @preferred_locations.to_a.reject(&:blank?).map(&:to_sym)
  end

  def search_query
    @search_query.to_s.strip
  end

  def include_not_interested
    ActiveModel::Type::Boolean.new.cast(@include_not_interested)
  end

  # private

  def query_and_paginate
    @_records = Job.includes(:role_type)
    # sort_records
    country_filter_records
    role_type_filter_records
    preferred_location_filter_records
    search_query_filter_records
    # role_level_filter_records
    # category_filter_records
    # search_status_filter_records

    # badges_filter_records
    # specialty_filter_records
    @pagy, @records = build_pagy(@_records, items: items_per_page)
  end

  def items_per_page
    @items_per_page || Pagy::DEFAULT[:items]
  end

  def empty_search?
    role_types.empty? &&
      search_query.blank? &&
      countries.empty? &&
      preferred_locations.blank?
  end

  def badges_filter_records
    badges.each do |badge|
      case badge
      when :high_response_rate
        @_records.merge!(Developer.high_response_rate)
      when :source_contributor
        @_records.merge!(Developer.source_contributor)
      when :recently_added
        @_records.merge!(Developer.recently_added)
      when :recently_updated
        @_records.merge!(Developer.recently_updated)
      end
    end
  end

  def sort_records
    if sort == :relevance
      @_records.merge!(Employee.recently_updated_first)
    else
      @_records.merge!(Employee.newest_first)
    end
  end

  def country_filter_records
    @_records.merge!(Job.filter_by_countries(countries)) if countries.any?
  end

  def role_type_filter_records
    @_records.merge!(Job.filter_by_role_types(role_types)) if role_types.any?
  end

  def preferred_location_filter_records
    @_records.merge!(Job.filter_by_preferred_location(preferred_locations)) if preferred_locations.any?
  end

  def search_query_filter_records
    @_records.merge!(Job.filter_by_search_query(search_query)) unless search_query.empty?
  end

  # Needed for #pagy (aliased to #build_pagy) helper.
  def params
    options
  end
end
