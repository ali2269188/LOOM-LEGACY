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
    class PortProber
      def self.above(port)
        port += 1 until free? port
        port
      end

      IGNORED_ERRORS = [Errno::EADDRNOTAVAIL, Errno::EAFNOSUPPORT].tap { |arr|
        arr << Errno::EBADF if Platform.cygwin?
        arr << Errno::EACCES if Platform.windows?
      }.freeze

      def self.free?(port)
        Platform.interfaces.each do |host|
          TCPServer.new(host, port).close
        rescue *IGNORED_ERRORS => e
          WebDriver.logger.debug("port prober could not bind to #{host}:#{port} (#{e.message})", id: :driver_service)
          # ignored - some machines appear unable to bind to some of their interfaces
        end

        true
      rescue SocketError, Errno::EADDRINUSE
        false
      end
    end # PortProber
  end # WebDriver
end # Selenium
