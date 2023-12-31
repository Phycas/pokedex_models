# frozen_string_literal: true
# rubocop:todo all

# Copyright (C) 2015-2020 MongoDB Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Mongo
  class BulkWrite

    # Defines behavior around combiners
    #
    # @api private
    #
    # @since 2.1.0
    module Combineable

      # @return [ Array<Hash, BSON::Document> ] requests The provided requests.
      attr_reader :requests

      # Create the ordered combiner.
      #
      # @api private
      #
      # @example Create the ordered combiner.
      #   OrderedCombiner.new([{ insert_one: { _id: 0 }}])
      #
      # @param [ Array<Hash, BSON::Document> ] requests The bulk requests.
      #
      # @since 2.1.0
      def initialize(requests)
        @requests = requests
        @has_collation = false
        @has_array_filters = false
        @has_hint = false
      end

      # @return [ Boolean ] Whether one or more operation specifies the collation
      #   option.
      def has_collation?
        @has_collation
      end

      # @return [ Boolean ] Whether one or more operation specifies the
      #   array_filters option.
      def has_array_filters?
        @has_array_filters
      end

      # @return [ Boolean ] Whether one or more operation specifies the
      #   hint option.
      def has_hint?
        @has_hint
      end

      private

      def combine_requests(ops)
        requests.reduce(ops) do |operations, request|
          add(operations, request.keys.first, request.values.first)
        end
      end
    end
  end
end
