# frozen_string_literal: true

module Admin
  class BasicLinkPostComponent < ApplicationComponent
    def initialize(title, path, name:, value:)
      @title = title
      @path = path
      @value = value
      @name = name
    end

    def call
      button_to(title, path, { class: 'btn btn-primary', params: { name => value } })
    end

    private

    attr_reader :title, :path, :name, :value
  end
end
