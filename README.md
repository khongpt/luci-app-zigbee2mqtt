# luci-app-zigbee2mqtt

luci-app-zigbee2mqtt
Luci app manage zigbee2mqtt configuration/setting (Domoticz on domorouter - domo3g)

# install

    cd package/feeds/
    git clone https://github.com/khongpt/luci-app-zigbee2mqtt.git
    
    

    **Remove line in /golex/openwrt/feeds/node/node-zigbee2mqtt/Makefile
      $(INSTALL_BIN) ./files/zigbee2mqtt.init $(1)/etc/init.d/zigbee2mqtt
    **cp configuration.yaml to files/opt/zigbee2mqtt/data/

    ** configuration
        homeassistant: false
        permit_join: true
        mqtt:
          base_topic: zigbee2mqtt
          server: mqtt://localhost
        advanced:
          log_level: info
          log_directory: /tmp
          log_file: zigbee2mqtt.info
        serial:
          port: /dev/ttyUSB0
