
# ######################################################################## #
# File:     lib/diagnosticism/version.rb
#
# Purpose:  Version for Diagnosticism.Ruby library
#
# Created:  3rd January 2025
# Updated:  6th March 2025
#
# Home:     http://github.com/synesissoftware/Diagnosticism.Ruby
#
# Author:   Matthew Wilson
#
# Copyright (c) 2025, Matthew Wilson and Synesis Information Systems
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the names of the copyright holders nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ######################################################################## #


=begin
=end

module Diagnosticism

  # Current version of the Diagnosticism library
  VERSION           = '0.1.1'

  private
  VERSION_PARTS_    = VERSION.split(/[.]/).collect { |n| n.to_i } # :nodoc:
  public
  # Major version of the Diagnosticism library
  VERSION_MAJOR     = VERSION_PARTS_[0] # :nodoc:
  # Minor version of the Diagnosticism library
  VERSION_MINOR     = VERSION_PARTS_[1] # :nodoc:
  # Revision version of the Diagnosticism library
  VERSION_REVISION  = VERSION_PARTS_[2] # :nodoc:
end # module Diagnosticism


# ############################## end of file ############################# #

