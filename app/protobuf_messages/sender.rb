module ProtobufMessages::Sender

  def self.send( message, connection )
    # TODO schedule in background worker
    send_message message, connection
  end

  private

  def self.serialize_message( message )
    msg = message.encode.to_s

    length = [msg.size].pack('N')

    wrapped_message = length + msg

    wrapped_message
  end

  def self.send_message( message, connection )
    data = serialize_message( message )

    Log.debug 'Sending Message'
    Log.debug "    Message: #{message.inspect}"
    Log.debug "    Data: #{data.inspect}"

    # TODO use mutex to lock use of socket?
    connection.send_data data
  end
end

