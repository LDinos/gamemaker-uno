/// @description
/// @description
if (global.game_started) {
	with(obj_client) {
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NET_STOP_GAME)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
	instance_destroy()
}