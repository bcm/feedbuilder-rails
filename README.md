Utilities that simplify the process of building and delivering Atom feeds based on collections of objects.

## Usage

    require 'feedbuilder-rails'
    require 'will_paginate' # to get paging links

    FeedBuilder.feed_id_domain = 'maz.org'

    class Nug < ActiveRecord::Base
      acts_as_feed_provider

      def entry_title
        name # a persistent attribute
      end

      def entry_summary
        Atom::Content::Text.new("A nug named #{name}")
      end

      def entry_content
        Atom::Content::Html.new("<p>A nug named #{name}</p>")
      end
    end

    class NugsController < ApplicationController
      def index
        respond_to do |format|
          format.atom do
            nugs = Nug.paginate(:page => (params[:page] || 1), :page_size => (params[:page_size] || 10))
            send_feed("nugs.atom", :etag => nugs) do
              url_builder = feed_url_builder(root_url, nugs_url)
              options = {:feed_title => "Bucket o' nugs", :feed_id_path => nugs_path}
              Nug.build_feed(nugs, url_builder, options) do |nug, entry|
                 entry.id = Nug.feed_tag_uri(nug_path(nug), :date => nug.created_at)
                 entry.links << Atom::Link.new(:href => nug_url(nug), :rel => :alternate, :type => 'text/html')
              end
            end
          end
        end
      end
    end
