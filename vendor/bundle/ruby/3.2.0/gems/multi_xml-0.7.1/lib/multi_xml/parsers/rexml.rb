require "rexml/document" unless defined?(REXML::Document)

module MultiXml
  module Parsers
    module Rexml # :nodoc:
      extend self

      def parse_error
        ::REXML::ParseException
      end

      # Parse an XML Document IO into a simple hash using REXML
      #
      # xml::
      #   XML Document IO to parse
      def parse(xml)
        doc = REXML::Document.new(xml)
        raise(REXML::ParseException, "The document #{doc.to_s.inspect} does not have a valid root") unless doc.root

        merge_element!({}, doc.root)
      end

      private

      # Convert an XML element and merge into the hash
      #
      # hash::
      #   Hash to merge the converted element into.
      # element::
      #   XML element to merge into hash
      def merge_element!(hash, element)
        merge!(hash, element.name, collapse(element))
      end

      # Actually converts an XML document element into a data structure.
      #
      # element::
      #   The document element to be collapsed.
      def collapse(element)
        hash = get_attributes(element)

        if element.has_elements?
          element.each_element { |child| merge_element!(hash, child) }
          merge_texts!(hash, element) unless empty_content?(element)
          hash
        else
          merge_texts!(hash, element)
        end
      end

      # Merge all the texts of an element into the hash
      #
      # hash::
      #   Hash to add the converted element to.
      # element::
      #   XML element whose texts are to me merged into the hash
      def merge_texts!(hash, element)
        if element.has_text?
          # must use value to prevent double-escaping
          texts = element.texts.map(&:value).join
          merge!(hash, MultiXml::CONTENT_ROOT, texts)
        else
          hash
        end
      end

      # Adds a new key/value pair to an existing Hash. If the key to be added
      # already exists and the existing value associated with key is not
      # an Array, it will be wrapped in an Array. Then the new value is
      # appended to that Array.
      #
      # hash::
      #   Hash to add key/value pair to.
      # key::
      #   Key to be added.
      # value::
      #   Value to be associated with key.
      def merge!(hash, key, value)
        if hash.key?(key)
          if hash[key].instance_of?(Array)
            hash[key] << value
          else
            hash[key] = [hash[key], value]
          end
        elsif value.instance_of?(Array)
          hash[key] = [value]
        else
          hash[key] = value
        end
        hash
      end

      # Converts the attributes array of an XML element into a hash.
      # Returns an empty Hash if node has no attributes.
      #
      # element::
      #   XML element to extract attributes from.
      def get_attributes(element)
        attributes = {}
        element.attributes.each { |n, v| attributes[n] = v }
        attributes
      end

      # Determines if a document element has text content
      #
      # element::
      #   XML element to be checked.
      def empty_content?(element)
        element.texts.join.strip.empty?
      end
    end
  end
end
