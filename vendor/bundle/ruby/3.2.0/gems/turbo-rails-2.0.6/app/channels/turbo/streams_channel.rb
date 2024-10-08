# The streams channel delivers all the turbo-stream actions created (primarily) through <tt>Turbo::Broadcastable</tt>.
# A subscription to this channel is made for each individual stream that one wishes to listen for updates to.
# The subscription relies on being passed a <tt>signed_stream_name</tt> parameter generated by turning a set of streamables
# into signed stream name using <tt>Turbo::Streams::StreamName#signed_stream_name</tt>. This is automatically done
# using the view helper <tt>Turbo::StreamsHelper#turbo_stream_from(*streamables)</tt>.
# If the signed stream name cannot be verified, the subscription is rejected.
#
# In case if custom behavior is desired, one can create their own channel and re-use some of the primitives from
# helper modules like <tt>Turbo::Streams::StreamName</tt>:
#
#   class CustomChannel < ActionCable::Channel::Base
#     extend Turbo::Streams::Broadcasts, Turbo::Streams::StreamName
#     include Turbo::Streams::StreamName::ClassMethods
#
#     def subscribed
#       if (stream_name = verified_stream_name_from_params).present? &&
#           subscription_allowed?
#         stream_from stream_name
#       else
#         reject
#       end
#     end
#
#     def subscription_allowed?
#       # ...
#     end
#   end
#
# This channel can be connected to a web page using <tt>:channel</tt> option in
# <tt>turbo_stream_from</tt> helper:
#
#   <%= turbo_stream_from 'room', channel: CustomChannel %>
#
class Turbo::StreamsChannel < ActionCable::Channel::Base
  extend Turbo::Streams::Broadcasts, Turbo::Streams::StreamName
  include Turbo::Streams::StreamName::ClassMethods

  def subscribed
    if stream_name = verified_stream_name_from_params
      stream_from stream_name
    else
      reject
    end
  end
end
