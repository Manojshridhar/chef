#
# Author:: Adam Jacob (<adam@chef.io>)
# Copyright:: Copyright (c) Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "tempfile" unless defined?(Tempfile)
require_relative "execute"
require_relative "../win32/security" if ChefUtils.windows?
require "forwardable" unless defined?(Forwardable)

class Chef
  class Provider
    class Script < Chef::Provider::Execute
      extend Forwardable

      provides :bash
      provides :csh
      provides :ksh
      provides :perl
      provides :python
      provides :ruby
      provides :script

      def_delegators :new_resource, :interpreter, :flags, :code

      def command
        "\"#{interpreter}\" #{flags}"
      end

      def input
        code
      end
    end
  end
end
