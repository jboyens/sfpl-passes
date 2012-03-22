require "sfpl-passes/version"

require 'mechanize'
require 'active_support/core_ext/object/blank'
require 'active_support/inflector'
require 'date'

module SFPL
  PASSES = {
    exploratorium:                  "http://sflib1.sfpl.org/record=b2318142~S1",
    asian_art:                      "http://sflib1.sfpl.org/record=b2318133~S1",
    california_academy_of_sciences: "http://sflib1.sfpl.org/record=b2318134~S1",
    aquarium_of_the_bay:            "http://sflib1.sfpl.org/record=b2318132~S1",
    cartoon_art_museum:             "http://sflib1.sfpl.org/record=b2318136~S1",
    conservatory_of_flowers:        "http://sflib1.sfpl.org/record=b2318137~S1",
    sfmoma:                         "http://sflib1.sfpl.org/record=b2318150~S1",
    sfzoo:                          "http://sflib1.sfpl.org/record=b2318151~S1",
    childrens_creativity_museum:    "http://sflib1.sfpl.org/record=b2318154~S1"
  }

  module Passes
    def self.available(*museums)
      museums = PASSES.keys if museums.empty?

      museums.map do |key|
        { key => self.get_status(key).reject { |r| r[:status].is_a?(Date) } }
      end
    end

    def self.due
      Hash[PASSES.keys.map do |key|
        { key => self.get_status(key).select { |r| r[:status].is_a?(Date) } }
      end.map { |k,v| [k, v.to_time.strftime("%m-%d-%y")]}]
    end


    private

    def self.get_status(library = :sfmoma)
      agent = Mechanize.new

      page = agent.get(PASSES[library])

      statuses = page / "#bib_items" / "tr"
      statuses.map do |m|
        library = (m / "td[1]").text.presence
        status = (m / "td[3]").text.presence

        { :library => clean_unicode(library).titleize, :status => encode_status(clean_unicode(status)) } if library && status
      end.compact
    end

    def self.clean_unicode(str)
      str.force_encoding("UTF-8").encode!

      str.gsub("\xC2\xA0".force_encoding("UTF-8").encode!, '').chomp.strip
    end

    def self.encode_status(status)
      case status
      when /CHECK SHELF/ then :check_shelf
      when /JUST RETURNED/ then :just_returned
      when /DUE/
        Date.strptime(status.gsub("DUE", '').strip, "%m-%d-%Y")
      end
    end
  end
end
