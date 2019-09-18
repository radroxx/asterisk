FROM debian:buster

LABEL maintainer="Radroxxx <radroxxx@gmail.com>"

ENV ASTERISK_VERSION certified/13.21-cert4
ENV ASTERIS_VERSION_DONGLE 13.21
ENV DEBIAN_FRONTEND=noninteractive

RUN	set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends git autoconf automake ca-certificates \
# Download src
	&& git clone --branch ${ASTERISK_VERSION} --single-branch --depth 1 https://github.com/asterisk/asterisk.git /usr/local/src/asterisk \
	&& git clone https://github.com/wdoekes/asterisk-chan-dongle.git /usr/local/src/chan-dongle \
# Install asterisk
	&& cd /usr/local/src/asterisk \
	&& yes | contrib/scripts/install_prereq install \
	&& contrib/scripts/install_prereq test \
	&& ./bootstrap.sh && ./configure \
	&& make menuselect.makeopts \
	&& menuselect/menuselect --disable BUILD_NATIVE --disable-all \
		--enable chan_bridge_media \
		--enable chan_sip \
		--enable chan_rtp \
		--enable chan_alsa \
		--enable chan_pjsip \
		--enable cdr_csv \
		--enable cdr_sqlite3_custom \
		--enable cdr_pgsql \
		--enable cdr_adaptive_odbc \
		--enable cel_custom \
		--enable cel_sqlite3_custom \
		--enable cel_pgsql \
		--enable cel_odbc \
		--enable bridge_native_rtp \
		--enable bridge_simple \
		--enable codec_gsm \
		--enable codec_a_mu \
		--enable codec_alaw \
		--enable codec_ulaw \
		--enable codec_speex \
		--enable codec_opus \
		--enable codec_resample \
		--enable format_gsm \
		--enable format_wav \
		--enable format_wav_gsm \
		--enable format_pcm \
		--enable format_ogg_vorbis \
		--enable format_h264 \
		--enable format_h263 \
		--enable func_callerid \
		--enable func_cdr \
		--enable func_channel \
		--enable func_curl \
		--enable func_cut \
		--enable func_db \
		--enable func_logic \
		--enable func_math \
		--enable func_sprintf \
		--enable func_strings \
		--enable app_confbridge \
		--enable app_db \
		--enable app_dial \
		--enable app_echo \
		--enable app_exec \
		--enable app_mixmonitor \
		--enable app_originate \
		--enable app_playback \
		--enable app_playtones \
		--enable app_queue \
		--enable app_sendtext \
		--enable app_stack \
		--enable app_transfer \
		--enable app_system \
		--enable app_verbose \
		--enable app_voicemail \
		--enable app_externalivr \
		--enable app_fax \
		--enable app_image \
		--enable app_jack \
		--enable app_sms \
		--enable pbx_config \
		--enable pbx_lua \
		--enable pbx_realtime \
		--enable res_agi \
		--enable res_ari \
		--enable res_ari_applications \
		--enable res_ari_asterisk \
		--enable res_ari_bridges \
		--enable res_ari_channels \
		--enable res_ari_device_states \
		--enable res_ari_endpoints \
		--enable res_ari_events \
		--enable res_ari_mailboxes \
		--enable res_ari_model \
		--enable res_ari_playbacks \
		--enable res_ari_recordings \
		--enable res_ari_sounds \
		--enable res_clioriginate \
		--enable res_config_curl \
		--enable res_config_sqlite3 \
		--enable res_config_odbc \
		--enable res_curl \
		--enable res_format_attr_h263 \
		--enable res_format_attr_h264 \
		--enable res_format_attr_opus \
		--enable res_format_attr_vp8 \
		--enable res_http_post \
		--enable res_http_websocket \
		--enable res_odbc \
		--enable res_odbc_transaction \
		--enable res_parking \
		--enable res_pjproject \
		--enable res_pjsip \
		--enable res_pjsip_acl \
		--enable res_pjsip_authenticator_digest \
		--enable res_pjsip_caller_id \
		--enable res_pjsip_config_wizard \
		--enable res_pjsip_dialog_info_body_generator \
		--enable res_pjsip_diversion \
		--enable res_pjsip_dlg_options \
		--enable res_pjsip_dtmf_info \
		--enable res_pjsip_empty_info \
		--enable res_pjsip_endpoint_identifier_anonymous \
		--enable res_pjsip_endpoint_identifier_ip \
		--enable res_pjsip_endpoint_identifier_user \
		--enable res_pjsip_exten_state \
		--enable res_pjsip_header_funcs \
		--enable res_pjsip_logger \
		--enable res_pjsip_messaging \
		--enable res_pjsip_mwi \
		--enable res_pjsip_mwi_body_generator \
		--enable res_pjsip_nat \
		--enable res_pjsip_notify \
		--enable res_pjsip_one_touch_record_info \
		--enable res_pjsip_outbound_authenticator_digest \
		--enable res_pjsip_outbound_publish \
		--enable res_pjsip_outbound_registration \
		--enable res_pjsip_path \
		--enable res_pjsip_pidf_body_generator \
		--enable res_pjsip_pidf_digium_body_supplement \
		--enable res_pjsip_pidf_eyebeam_body_supplement \
		--enable res_pjsip_publish_asterisk \
		--enable res_pjsip_pubsub \
		--enable res_pjsip_refer \
		--enable res_pjsip_registrar \
		--enable res_pjsip_rfc3326 \
		--enable res_pjsip_sdp_rtp \
		--enable res_pjsip_send_to_voicemail \
		--enable res_pjsip_session \
		--enable res_pjsip_sips_contact \
		--enable res_pjsip_t38 \
		--enable res_pjsip_transport_websocket \
		--enable res_pjsip_xpidf_body_generator \
		--enable res_realtime \
		--enable res_rtp_asterisk \
		--enable res_sorcery_astdb \
		--enable res_sorcery_config \
		--enable res_sorcery_memory \
		--enable res_sorcery_memory_cache \
		--enable res_sorcery_realtime \
		--enable res_srtp \
		--enable res_chan_stats \
		--enable res_config_ldap \
		--enable res_config_pgsql \
		--enable res_config_sqlite \
		--enable res_corosync \
		--enable res_endpoint_stats \
		--enable res_snmp \
		--enable astdb2sqlite3 \
		--enable astcanary \
		--enable OPTIONAL_API \
		--enable MOH-OPSOUND-WAV \
		--enable CORE-SOUNDS-EN-WAV \
		--enable CORE-SOUNDS-RU-WAV \
		--enable EXTRA-SOUNDS-EN-WAV \
		menuselect.makeopts \
	&& make all \
	&& make install \
	&& make dist-clean \
	&& make clean \
# Install chan-dongle
	&& cd /usr/local/src/chan-dongle \
	&& ./bootstrap && ./configure --with-astversion=${ASTERIS_VERSION_DONGLE} \
	&& make all \
	&& make install \
	&& make distclean \
# Postinstall
	&& addgroup --system --gid 1000 asterisk \
	&& adduser --system --uid 1000 --ingroup asterisk --quiet -home /var/lib/asterisk --no-create-home --disabled-login --gecos "Asterisk PBX daemon" asterisk \
	&& chown -R asterisk:dialout /var/*/asterisk \
	&& chmod -R 750 /var/spool/asterisk \
# Optional packages
    && apt install sendemail libnet-ssleay-perl libio-socket-ssl-perl
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 5060/udp 5061/udp 5062/udp

STOPSIGNAL SIGTERM

WORKDIR /var/lib/asterisk/
HEALTHCHECK --interval=10s --timeout=10s --retries=3 CMD /usr/sbin/asterisk -rx "core show sysinfo"

ENTRYPOINT ["/usr/sbin/asterisk","-f","-n","-Uasterisk","-Gdialout"]

CMD ["-v"]
