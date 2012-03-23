require 'open-uri'
require 'nokogiri'

module Devry

  module Helpers

    def extract_text(element)
      return nil if element.nil?
      element.text.strip
    end

    def extract_time(element)
      return nil if element.nil?
      Time.parse(extract_text(element))
    end

    def extract_url(element)
      return nil if element.nil?
      element.at("a")['href']
    end

    def fetch_page(url)
      Nokogiri::HTML open(url)
    end

    def extract_description(url)
      page = fetch_page(url)

      selectors = (10..15).map do |tr_index|
        "tr:nth-child(#{tr_index})"
      end

      selectors.map do |selector|
        page.at(selector).to_s
      end.join.gsub("\n", "")
    end

  end

  class Job

    extend Helpers
    include Helpers

    BASE_URI = 'https://devryuniversity-devry.icims.com/jobs/search?pr='

    def self.all
      page = fetch_page("#{BASE_URI}1")

      page.to_s =~ /Page (\d+) of (\d+)/
      page_count = $2.to_i

      jobs  = []

      (1..page_count).each do |page_number|

        page = fetch_page("#{BASE_URI}#{page_number}")

        page.search(".iCIMS_JobsTable tr").each_with_index do |row, idx|

          next if idx == 0 # skip header

          details = row.search("td")

          job = Job.new(:id    => extract_text(details[0]),
                        :title => extract_text(details[1]),
                        :location => extract_text(details[2]),
                        :posted_date => extract_time(details[3]),
                        :url => extract_url(details[1]))

          jobs << job
        end

      end

      jobs
    end

    attr_reader :id, :title, :location, :posted_date, :url

    def initialize(attributes = {})
      attributes.each do |k, v|
        instance_variable_set(:"@#{k}", v)
      end
    end

    def city
      split_location[2]
    end

    def state
      split_location[1]
    end

    def country
      split_location[0]
    end

    def description
      Devry::Job.extract_description(url)
    end

    private

    def split_location
      location.split('-')
    end

  end

end
