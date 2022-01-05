if server >= 0
{
	var n_id = ds_map_find_value(async_load, "id");
	//if n_id == client_socket
    {
		var t = ds_map_find_value(async_load, "type");
    switch(t)
        {
        case network_type_data:
            //Data handling here...
			var s_buffer = ds_map_find_value(async_load, "buffer")
			receive_packet(s_buffer)
            break;
		case network_type_disconnect:
			network_destroy(client_socket)
			break;
        }
    }
}