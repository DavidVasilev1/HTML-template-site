make:
	rm -f ./pages/*.ts
	sleep 2
	ffmpeg -rtsp_transport tcp -i rtsp://admin:abc12345@192.168.10.118:554/ \
		-c copy -f hls -hls_time 10 -hls_list_size 8 -hls_flags delete_segments \
		./pages/stream.m3u8 & 
	ffmpeg -rtsp_transport tcp -i rtsp://admin:abc12345@192.168.10.119:554/ \
		-c copy -f hls -hls_time 10 -hls_list_size 8 -hls_flags delete_segments \
		./pages/stream2.m3u8 &
	sleep 2
	bundle exec jekyll serve