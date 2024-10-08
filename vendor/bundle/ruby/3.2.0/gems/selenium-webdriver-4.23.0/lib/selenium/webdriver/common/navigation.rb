# frozen_string_literal: true

# Licensed to the Software Freedom Conservancy (SFC) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The SFC licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Selenium
  module WebDriver
    class Navigation
      def initialize(bridge)
        @bridge = bridge
      end

      #
      # Navigate to the given URL
      #

      def to(url)
        @bridge.get url
      end

      #
      # Move back a single entry in the browser's history.
      #

      def back
        @bridge.go_back
      end

      #
      # Move forward a single entry in the browser's history.
      #

      def forward
        @bridge.go_forward
      end

      #
      # Refresh the current page.
      #

      def refresh
        @bridge.refresh
      end
    end # Navigation
  end # WebDriver
end # Selenium
