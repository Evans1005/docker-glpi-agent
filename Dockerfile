FROM ubuntu
MAINTAINER Evans

RUN apt update
RUN apt install wget cron dbus libalgorithm-c3-perl libapparmor1 libauthen-sasl-perl libavahi-client3 libavahi-common-data libavahi-common3 libb-hooks-endofscope-perl libb-hooks-op-check-perl libclass-c3-perl libclass-c3-xs-perl libclass-data-inheritable-perl libclass-inspector-perl libclass-method-modifiers-perl libclass-singleton-perl libclass-xsaccessor-perl libclone-perl libcpanel-json-xs-perl libcrypt-des-perl libcups2 libdata-dump-perl libdata-optlist-perl libdatetime-locale-perl libdatetime-perl libdatetime-timezone-perl libdbus-1-3 libdevel-callchecker-perl libdevel-caller-perl libdevel-lexalias-perl libdevel-stacktrace-perl libdigest-hmac-perl libdynaloader-functions-perl libencode-locale-perl libeval-closure-perl libexception-class-perl libexpat1 libfile-listing-perl libfile-sharedir-perl libfile-which-perl libfont-afm-perl libgdbm-compat4 libgdbm6 libhtml-form-perl libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libicu70 libimport-into-perl libio-html-perl libio-socket-ssl-perl libkmod2 liblwp-mediatypes-perl liblwp-protocol-https-perl libmailtools-perl libmodule-implementation-perl libmodule-runtime-perl libmoo-perl libmro-compat-perl libnamespace-autoclean-perl libnamespace-clean-perl libnet-cups-perl libnet-http-perl libnet-ip-perl libnet-nbname-perl libnet-smtp-ssl-perl libnet-snmp-perl libnet-ssh2-perl libnet-ssleay-perl libossp-uuid-perl libossp-uuid16 libpackage-stash-perl libpackage-stash-xs-perl libpadwalker-perl libparallel-forkmanager-perl libparams-classify-perl libparams-util-perl libparams-validationcompiler-perl libparse-edid-perl libpci3 libperl5.34 libproc-daemon-perl libproc-processtable-perl libreadonly-perl libref-util-perl libref-util-xs-perl librole-tiny-perl libsocket-getaddrinfo-perl libspecio-perl libssh2-1 libsub-exporter-perl libsub-exporter-progressive-perl libsub-identify-perl libsub-install-perl libsub-name-perl libsub-quote-perl libterm-readkey-perl libtext-template-perl libtimedate-perl libtry-tiny-perl libuniversal-require-perl liburi-perl libusb-1.0-0 libvariable-magic-perl libwww-perl libwww-robotrules-perl libxml-libxml-perl libxml-namespacesupport-perl libxml-parser-perl libxml-sax-base-perl libxml-sax-expat-perl libxml-sax-perl libxml2 libxstring-perl libyaml-0-2 libyaml-libyaml-perl libyaml-perl libyaml-tiny-perl netbase pci.ids pciutils perl perl-modules-5.34 perl-openssl-defaults ucf usbutils -y
ADD glpi-agent_1.5-1_all.deb /root/
ADD glpi-agent-task-esx_1.5-1_all.deb /root/
ADD glpi-agent-task-network_1.5-1_all.deb /root/
WORKDIR /root/
RUN dpkg --install glpi-agent_1.5-1_all.deb
RUN dpkg --install glpi-agent-task-esx_1.5-1_all.deb
RUN dpkg --install glpi-agent-task-network_1.5-1_all.deb
RUN rm glpi-agent-task-esx_1.5-1_all.deb glpi-agent-task-network_1.5-1_all.deb glpi-agent_1.5-1_all.deb
ADD agent.sh /root/
ADD esx.sh /root/
ADD netdiscovery.sh /root/

CMD ["/bin/bash",/root/agent.sh]
